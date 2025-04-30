---@diagnostic disable: undefined-global, deprecated

--- Debug Flag
TEST = true

function Defer()
	local defer = {}

	function defer.add(fn)
		table.insert(defer, fn)
	end

	function defer.run()
		for _, v in ipairs(defer) do
			v()
		end
	end

	return defer
end

local defer = Defer()

--- --- ---
--- Lua
--- --- ---

local req = require
---@param modname string
---@param reload boolean?
---@return unknown
function require(modname, reload)
	if reload then
		package.loaded[modname] = nil
	end
	return req(modname)
end

if false then
	---@overload fun(modname:string,reload:boolean?):unknown
	require = req
end

local function strs(...)
	local t = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		t[i] = tostring(v)
	end
	return t
end

if release_print then
	function print(...)
		release_print(table.concat(strs(...), "\t"))
	end
end
function printf(fmt, ...)
	local ok, ret = pcall(string.format, fmt, ...)
	if not ok then
		error(ret, 2)
	end
	print(ret)
end

function assert_type(n, v, t, o, l)
	l = l or 0
	if o and v == nil then
		return
	end
	if type(t) == "table" then
		for _, t1 in ipairs(t) do
			if not type(v) == t1 then
				error(("%s has to be one of %s, got %s"):format(n, table.concat(t, "|"), v), 2 + l)
			end
		end
		return
	end
	if type(t) == "string" then
		if type(v) ~= t then
			error(("%s has to be a %s, got %s"):format(n, t, v), 2 + l)
		end
		return
	end
	error("Wrong type of t", 2 + l)
end

local Types = {
	string = nil, ---@type string
	integer = nil, ---@type integer
	number = nil, ---@type number
	boolean = nil, ---@type boolean
	table = nil, ---@type table
	_func = nil, ---@type function
	_nil = nil, ---@type nil
	userdata = nil, ---@type userdata
	thread = nil, ---@type thread
	lightuserdata = nil, ---@type lightuserdata
	bit = nil, ---@type 0|1
}

---@generic T
---@param _ T
---@return T
function as(x, _)
	return x
end

---@return unknown
function unknown(x)
	return x
end

HC = {}

HC.is_server = not not sendluamsg
HC.is_client = not not (type(SL) == "table" and type(GUI) == "table")

function HC.print(...)
	print(HC.Serializer.new():serialize_varargs(...))
end

function HC.printf(fmt, ...)
	print(string.format(fmt, HC.Serializer.new():serialize_varargs(...)))
end

function HC.runcode(code, env)
	local fn, err = HC.loadcode(code)
	if not fn then
		return false, err
	end
	if env then
		debug.setfenv(fn, env)
	end
	return HC.packpcall(fn)
end

function HC.loadcode(code)
	if loadstring then
		return loadstring(code)
	else
		return load(code)
	end
end

function Pipe(...)
	local args = HC.packlen(...)
	return function(fn, ...)
		if fn == nil then
			return args
		end
		if type(fn) == "function" then
			local append_args = HC.packlen(...)
			table.move(append_args, 1, append_args.n, args.n + 1, args)
			args.n = args.n + append_args.n
			return Pipe(fn(HC.unpacklen(args)))
		end
		error("Wrong argument to pipe")
	end
end

function HC.collect(ret, next, tbl, i)
	local i, v = next(tbl, i)
	if i == nil then
		return ret
	end
	if v == nil then
		v = i
	end
	table.insert(ret, v)
	return HC.collect(ret, next, tbl, i)
end

--- ---
--- Table functions
--- ---
function HC.check(t, k)
	local ret = t[k]
	if ret == nil then
		ret = {}
		t[k] = ret
	end
	return ret
end

function HC.is_list(x)
	local i = 0
	for _ in pairs(x) do
		i = i + 1
		if x[i] == nil then
			return false
		end
	end
	return true
end

local function deepcopy(t, seen)
	if type(t) ~= "table" then
		return t
	end
	if seen[t] then
		error("deepcopy loop")
	end
	seen[t] = true
	local ret = {}
	for k, v in pairs(t) do
		ret[deepcopy(k, seen)] = deepcopy(v, seen)
	end
	seen[t] = nil
	return ret
end
function HC.deepcopy(t)
	return deepcopy(t, {})
end

local function _gsplit(s)
	if s.done then
		return
	end
	-- special case for sep == ""
	-- simply iterate all chars
	if s.sep == "" then
		if s.i == s.len then
			s.done = true
		end
		local i = s.i
		s.i = s.i + 1
		return s.str:sub(i, i)
	end
	if s.trimempty and s.i > s.len then
		return
	end
	-- normal split using string.find
	local _i, _e = string.find(s.str, s.sep, s.i, s.plain)
	if _i == nil then
		s.done = true
		return s.str:sub(s.i)
	end
	--- simply skip this iteration
	if s.trimempty and _e == 1 then
		s.i = s.i + 1
		return _gsplit(s)
	end
	-- string.find("a|c","|") returns (2,2)
	-- so use previous i and e-1 gives "a"
	local i = s.i
	s.i = _e + 1
	return s.str:sub(i, _e - 1)
end
local function gsplit(str, sep, opts)
	local plain, trimempty
	if type(opts) == "boolean" then
		plain = opts
	else
		opts = opts or {}
		plain, trimempty = opts.plain, opts.trimempty
	end
	local s = { str = str, sep = sep, i = 1, len = #str, plain = plain, trimempty = trimempty, done = false }
	--- match vim.gsplit's function signature
	return function()
		return _gsplit(s)
	end
end
local function split(str, sep, opts)
	local list = {}
	for s in gsplit(str, sep, opts) do
		table.insert(list, s)
	end
	return list
end
HC.split = split

--- ---
--- General functions
--- ---

function HC.dynamic_simple(map)
	return setmetatable({}, {
		__index = function(t, k)
			local fn = map[k]
			if fn then
				return fn(t)
			end
		end,
	})
end

-- general unpack
function HC.unpack(...)
	return (table.unpack or unpack)(...)
end

-- pack with length
function HC.packlen(...)
	return { n = select("#", ...), ... }
end

-- unpack with length
function HC.unpacklen(t)
	return HC.unpack(t, 1, t.n)
end

-- wrap result
function HC.ok_and_pack(ok, ...)
	return ok, HC.packlen(...)
end

-- pcall then pack the result
function HC.packpcall(func, ...)
	return HC.ok_and_pack(pcall(func, ...))
end

-- wrap function to pcall and pack the result
function HC.packpwrap(func)
	return function(...)
		return HC.packpcall(func, ...)
	end
end

-- drop the success flag of pcall
function HC.ok_or_nil(ok, ...)
	if ok then
		return ...
	end
end

-- pcall then drop the success flag
function HC.nilpcall(func, ...)
	return HC.ok_or_nil(pcall(func, ...))
end

-- wrap function to pcall and drop the success flag
function HC.nilpwrap(func)
	return function(...)
		return HC.nilpcall(func, ...)
	end
end

-- move
function HC.moveargs(t, ...)
	t.n = t.n or #t
	local e = select("#", ...)
	for i = 1, e do
		t[i] = select(i, ...)
	end
	t.n = t.n + e
end

--- ---
--- Class module
--- ---
local mtCache = {}
Class = {}
function Class.getmt(base)
	local ret = mtCache[base]
	if not ret then
		ret = { __index = base }
		mtCache[base] = ret
	end
	return ret
end

---@generic T
---@param base T
---@return T
function Class.new(base, new)
	local mt = Class.getmt(base)
	return setmetatable(new or {}, mt)
end

--- ---
--- Cache module
--- ---
local IS_NIL = setmetatable({}, { __tostring = "Nil" })
local IS_NAN = setmetatable({}, { __tostring = "NaN" })
local IS_RET = setmetatable({}, { __tostring = "Ret" })
--- A special index function allows nil and nan as key
local function pkey(k)
	if k == nil then
		k = IS_NIL
	elseif k ~= k then
		k = IS_NAN
	end
	return k
end

--- safe index that can handle nil and nan key
local function pindex(t, k)
	k = pkey(k)
	local ret = t[k]
	if ret == nil then
		ret = {}
		t[k] = ret
	end
	return ret
end

local PCache = {}

--- WALKAROUND: __newindex for nil key is unavaliable in lua 5.1
--- use class with :get :set instead.
function PCache.new()
	local obj = Class.new(PCache)
	obj.data = {}
	return obj
end

function PCache:get(k)
	return self.data[(k)]
end

function PCache:set(k, v)
	self.data[pkey(k)] = v
end

--- General Cache object
--- Allow multipe arg to be cached
Cache = {}
---@generic T:function
---@param fn T
---@return T
function Cache.create(fn)
	local cache = {}
	local function retf(...)
		local c = cache
		for i = 1, select("#", ...) do
			c = pindex(c, select(i, ...))
		end
		local ret = c[IS_RET]
		if ret == nil then
			ret = HC.packlen(fn(...))
			c[IS_RET] = ret
		end
		return HC.unpacklen(ret)
	end
	return retf
end

--- Take a function then convert it to table
---@generic K,V
---@param fn fun(K):V?
---@return table<K,V>
function Cache.table(fn)
	return setmetatable({}, {
		__index = Cache.create(function(_, K)
			local R = fn(K)
			return R
		end),
	})
end

--- 序列化器配置项
---@class SerializerOptions
---@field auto_join boolean 是否自动折叠短表
---@field indent string 缩进字符串
---@field join_length integer 折叠长度阈值
---@field metatable boolean 是否序列化元表
---@field newline string 换行符
---@field sep string 分隔符
---@field sep_tuple string 元组分隔符
---@field sort_key boolean 是否排序键
---@field ref_show boolean 显示引用数
---@field ref_auto_show boolean 只在必要时显示引用数
---@field ref_show_count boolean 显示引用数量
---@field ref_filters table<type,boolean> 显示引用类型
---@field whitespace_brace string 大括号周围空格
---@field whitespace_bracket string 方括号周围空格
---@field whitespace_operator string 操作符周围空格
---@field whitespace_separator string 分隔符周围空格
---@field brace {[1]:string,[2]:string} 花括号的定义
---@field bracket {[1]:string,[2]:string} 方括号的定义
---@field field string 声明字段的关键字

--- 序列化器类
---@class Serializer
local Serializer = {
	--- 默认配置
	---@type SerializerOptions
	opt = {
		auto_join            = true,
		indent               = "\t",
		join_length          = 20,
		metatable            = true,
		newline              = "\n",
		sep                  = ",",
		sep_tuple            = "    ",
		ref_show             = true,
		ref_auto_show        = true,
		ref_show_count       = true,
		ref_filters          = { ["table"] = true, ["function"] = true, ["thread"] = true },
		sort_key             = true,
		whitespace_brace     = "",
		whitespace_bracket   = "",
		whitespace_operator  = " ",
		whitespace_separator = " ",
		brace                = { "{", "}" },
		bracket              = { "[", "]" },
		field                = "=",
	},
	--- 预设配置
	---@type table<any,SerializerOptions|{}>
	presets = {
		oneline = {
			ref_show             = false,
			auto_join            = false,
			indent               = "",
			newline              = "",
			sep                  = ",",
			ref_auto_show        = true,
			whitespace_operator  = "",
			whitespace_separator = "",
		},
		compact = {
			auto_join            = true,
			join_length          = 100,
			indent               = " ",
			sep                  = ",",
			whitespace_operator  = "",
			whitespace_separator = "",
		},
		pretty = {
			auto_join            = true,
			whitespace_brace     = " ",
			whitespace_bracket   = " ",
			whitespace_operator  = " ",
			whitespace_separator = " ",
		},
		static = {
			auto_join            = true,
			indent               = "  ",
			whitespace_brace     = " ",
			whitespace_bracket   = " ",
			whitespace_operator  = " ",
			whitespace_separator = " ",
		},
	},
}
--- 创建新的序列化器实例
---@param option string|SerializerOptions|{}? 配置项或预设名称
---@return Serializer 序列化器实例
function Serializer.new(option)
	local obj = Class.new(Serializer)
	if type(option) == "string" then
		option = Serializer.presets[option]
	end
	obj.opt = setmetatable(option or {}, { __index = Serializer.opt })
	obj:reset()
	return obj
end

--- 重置序列化器状态
function Serializer:reset()
	self.env = {
		force_expand = false,
		depth = 0,
		cache = {},
		refs = setmetatable({}, { __mode = "k" }),
		ref_type_id = {},
	}
end

--- 序列化多个值
---@param ... any 要序列化的值
---@return string 序列化结果
function Serializer:serialize_varargs(...)
	local ret = { n = select("#", ...) }
	for i = 1, ret.n do
		table.insert(ret, self:serialize(select(i, ...)))
	end
	return HC.unpacklen(ret)
end

--- 序列化元组
---@param ... any 要序列化的值
---@return string 序列化结果
function Serializer:serialize_tuple(...)
	local ret = { n = select("#", ...) }
	for i = 1, ret.n do
		table.insert(ret, self:serialize(select(i, ...)))
	end
	return table.concat(ret, self.opt.sep_tuple)
end

--- 序列化任意值
---@param x any 要序列化的值
---@return string 序列化结果
function Serializer:serialize(x)
	local ref = self:_ref(x)
	local opt = self.opt
	local tx = type(x)
	if ref.count > 1 and opt.ref_filters[tx] then
		if not opt.ref_show then
			return "<loop>"
		end
		local body = {}
		table.insert(body, tx)
		table.insert(body, ref.id)
		if opt.ref_show_count then
			table.insert(body, ref.count)
		end
		if next(body) ~= nil then
			return ("<%s>"):format(table.concat(body, ":"))
		end
	end
	if tx == "table" then
		local v = self:_table(x)
		if opt.ref_show then
			return ("<%s:%s>"):format(tx, ref.id) .. v
		end
		return v
	elseif tx == "string" then
		return string.format("%q", x)
	elseif tx == "number" or tx == "boolean" then
		return tostring(x)
	else
		return opt.ref_show and ("<%s:%s>"):format(tx, ref.id) or ("<%s>"):format(tx)
	end
end

--- 序列化表
---@param x table 要序列化的表
---@return string 序列化结果
function Serializer:_table(x)
	local env = self.env
	local opt = self.opt
	env.depth = env.depth + 1
	-- 记录格式化条目
	local parts = {}
	-- 记录文本长度
	local len = 0
	-- 记录数组终点
	local list_length = 0
	-- 处理数组部分
	for i, v in ipairs(x) do
		local sv = self:serialize(v)
		table.insert(parts, sv)
		list_length = i
		len = len + #sv
	end
	-- 处理字典部分
	local dict = {}
	for k, v in pairs(x) do
		if type(k) ~= "number" or math.floor(k) ~= k or k < 1 or k > list_length then
			table.insert(dict, { k, v })
		end
	end
	-- 排序字典
	if opt.sort_key then
		table.sort(dict, function(a, b)
			local ka, kb = a[1], b[1]
			if type(ka) == "number" and type(ka) == type(kb) then
				return ka < kb
			end
			return tostring(ka) < tostring(kb)
		end)
	end
	-- 处理字典条目
	for _, kv in ipairs(dict) do
		local k, v = kv[1], kv[2]
		local sk = self:_key(k)
		local sv = self:serialize(v)
		local entry = sk .. opt.whitespace_operator .. opt.field .. opt.whitespace_operator .. sv
		table.insert(parts, entry)
		len = len + #entry
	end
	-- 处理元表
	if opt.metatable then
		local mt = getmetatable(x)
		if mt then
			local sk = self:_key("<metatable>")
			local sv = self:serialize(mt)
			local entry = sk .. opt.whitespace_operator .. opt.field .. opt.whitespace_operator .. sv
			table.insert(parts, entry)
			len = len + #entry
		end
	end
	-- 组装结果
	local joined_sep = opt.sep .. opt.whitespace_separator
	local total_len = len + (#joined_sep * (#parts - 1)) + #opt.brace[1] + #opt.brace[2]
	if opt.auto_join and not env.force_expand and total_len <= opt.join_length then
		env.depth = env.depth - 1
		return opt.brace[1] .. table.concat(parts, joined_sep) .. opt.brace[2]
	end
	local indent = opt.indent:rep(env.depth)
	for i, v in ipairs(parts) do
		parts[i] = indent .. v
	end
	env.depth = env.depth - 1
	return opt.brace[1] .. opt.newline
					.. table.concat(parts, opt.sep .. opt.newline) .. opt.newline
					.. opt.indent:rep(env.depth) .. opt.brace[2]
end

--- 序列化键
---@param k any 键
---@return string 序列化结果
function Serializer:_key(k)
	if type(k) == "string" and k:match("^[%a_][%w_]*$") then
		return k
	end
	local opt = self.opt
	return opt.bracket[1] .. opt.whitespace_bracket .. self:serialize(k) .. opt.whitespace_bracket .. opt.bracket[2]
end

--- 引用计数
---@param x any 值
---@return table 引用信息
function Serializer:_ref(x)
	local kv = pkey(x)
	local ref = self.env.refs[kv]
	if not ref then
		local t = type(x)
		local type_id = self.env.ref_type_id[t] or 0
		type_id = type_id + 1
		self.env.ref_type_id[t] = type_id
		ref = { id = type_id, count = 0 }
		self.env.refs[kv] = ref
	end
	ref.count = ref.count + 1
	return ref
end

HC.Serializer = Serializer

---@param option SerializerOptions
function HC.serialize(x, option)
	return Serializer.new(option):serialize(x)
end

function HC.serialize_tuple(...)
	return Serializer.new(option):serialize_tuple(...)
end

function HC.serialize_minimal(obj)
	local buffer = {}
	local t = type(obj)
	if t == "number" or t == "boolean" then
		table.insert(buffer, tostring(obj))
	elseif t == "string" then
		table.insert(buffer, string.format("%q", obj))
	elseif t == "table" then
		table.insert(buffer, "{")
		local max = 0
		for i, v in ipairs(obj) do
			max = i
			table.insert(buffer, HC.serialize_minimal(v))
			table.insert(buffer, ",")
		end
		for k, v in pairs(obj) do
			if not (type(k) == "number" and k >= 1 and k <= max and math.floor(k) == k) then
				table.insert(buffer, "[" .. HC.serialize_minimal(k) .. "]" .. "=" .. HC.serialize_minimal(v))
				table.insert(buffer, ",")
			end
		end
		if buffer[2] ~= nil then
			buffer[#buffer] = nil
		end
		table.insert(buffer, "}")
	else
		error("can not serialize a " .. t .. " type.")
	end
	return table.concat(buffer)
end

local cache = {}

---接受一个字符串，返回一个整数，该整数是字符串的哈希值。
---@param str string # 输入字符串
---@return integer # -2147483648 ~ 2147483647
function HC.hash(str)
	local ret = cache[str]
	if ret == nil then
		local sum = 0
		local mul = 1
		for i = 1, #str do
			mul = (i % 4 == 0) and 1 or mul * 256
			sum = sum + string.byte(str, i) * mul
		end
		ret = ((sum + (2 ^ (32 - 1))) % (2 ^ 32)) - (2 ^ (32 - 1))
		ret = math.floor(ret)
		cache[str] = ret
	end
	return ret
end

local function _forbit(num, pos)
	num = math.floor(num / 2 ^ pos)
	if num > 0 then
		local bitValue = num % 2
		return pos + 1, bitValue
	end
end

function HC.forbit(num)
	return _forbit, num, 0
end

function HC.map(tbl, fn)
	local ret = {}
	for k, v in pairs(tbl) do
		ret[k] = fn(v)
	end
	return ret
end

function HC.filter(tbl, fn)
	local ret = {}
	for k, v in pairs(tbl) do
		if fn(v) then
			ret[k] = v
		end
	end
	return ret
end

function HC.reduce(tbl, fn, init)
	local ret = init
	for _, v in pairs(tbl) do
		ret = fn(ret, v)
	end
	return ret
end

function HC.keys(tbl)
	local ret = {}
	for k, _ in pairs(tbl) do
		table.insert(ret, k)
	end
	return ret
end

function HC.values(tbl)
	local ret = {}
	for _, v in pairs(tbl) do
		table.insert(ret, v)
	end
	return ret
end

function HC.find(tbl, fn)
	local ret = nil
	for k, v in pairs(tbl) do
		if fn(v) then
			ret = k
			break
		end
	end
	return ret
end

function HC.select(tbl, fn)
	local ret = {}
	for _, v in pairs(tbl) do
		if fn(v) then
			table.insert(ret, v)
		end
	end
	return ret
end

---@generic T
---@param fn fun():T?
---@return T?
function HC.get(tbl, fn)
	for _, v in pairs(tbl) do
		local ret = fn(v)
		if ret then
			return ret
		end
	end
end

function HC.walk(tbl, fn)
	for k, v in pairs(tbl) do
		if type(v) == "table" then
			HC.walk(v, fn)
		else
			fn(tbl, k, v)
		end
	end
end

Rng = {}

--- Get a random key from a table.
---@generic T
---@param tbl table<T,any>
---@return T
function Rng.key(tbl)
	local keys = HC.keys(tbl)
	local index = math.random(1, #keys)
	return tbl[keys[index]]
end

--- Get a random value from a table.
---@generic T
---@param tbl table<any,T>
---@return T
function Rng.value(tbl)
	local values = HC.values(tbl)
	local index = math.random(1, #values)
	return values[index]
end

--- Create a weighted random table.
---@param tbl table<number,any[]>
---@return table<any,number>
function Rng.create(tbl)
	local ret = {}
	local total_weight = 0
	for weight, items in pairs(tbl) do
		local count = #items
		for _, item in ipairs(items) do
			table.insert(ret, { item, weight / count })
		end
		total_weight = total_weight + weight
	end
	for _, v in ipairs(ret) do
		v[2] = v[2] / total_weight
	end
	return ret
end

--- Get a random item from a weighted random table.
---@generic T
---@param tbl table<T,number>
---@return T
function Rng.get(tbl)
	local ret = 0
	local rng = math.random()
	local x = 0
	for _, v in ipairs(tbl) do
		x = x + v[2]
		if rng <= x then
			ret = v[1]
			break
		end
	end
	return ret
end

--- ---
--- 执行延迟调用
--- ---
defer.run()

return HC