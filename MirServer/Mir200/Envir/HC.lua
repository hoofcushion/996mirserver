--- Debug Flag
TEST = true

--- ---
--- HC module
--- HC is a module for Lua that provides some useful functions for 996m2 engine development.
--- It checks environment allows to run on both client and server side.
--- ---
local defer = {}

HC = {}

HC.is_server = not not sendluamsg
HC.is_client = not not (type(SL) == "table" and type(GUI) == "table")

local print = HC.is_server and release_print or
				HC.is_client
				and function(...) SL.Print(SL, ...) end
				or print


local id = 0


function HC.print(...)
	print(HC.Serializer.new():serialize_varargs(...))
end

function HC.printf(fmt, ...)
	print(string.format(fmt, HC.Serializer.new():serialize_varargs(...)))
end

function HC.runcode(code)
	if loadstring then
		return assert(loadstring(code))()
	else
		return assert(load(code))()
	end
end

local function pipe(...)
	local args = HC.packlen(...)
	return function(fn, ...)
		if fn == nil then
			return args
		end
		local append_args = HC.packlen(...)
		table.move(append_args, 1, append_args.n, args.n + 1, args)
		args.n = args.n + append_args.n
		return pipe(fn(HC.unpacklen(args)))
	end
end
HC.pipe = pipe

---@param str string # 提示字符串
---@param actor string? # 服务端需要传入 actor
function HC.tips(str, actor)
	if HC.is_client then
		SL:ShowSystemTips(str)
	else
		if actor == nil then
			error("actor is nil", 2)
		end
		sendmsg(actor, 1, tbl2json({
			Msg = str,
			Type = 9
		}))
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
local Class = {}
HC.Class = Class
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
	local obj = HC.Class.new(PCache)
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
local Cache = {}
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

HC.Cache = Cache

---@class HC.Serializer
local Serializer = {
	---@class HC.keyset.serialize_flags
	---@field auto_join            boolean                            # auto join small tables
	---@field indent               " "|"  "|"   "|"    "|"\t"|string  # indent string
	---@field join_length          integer                            # max length of small tables to join
	---@field metatable            boolean                            # include metatable
	---@field newline              "\n"|"\r\n"|string                 # newline string
	---@field sep                  ","|";"|string                     # separator string
	---@field sep_tuple            " "|"    "|"\t"|string             # separator string for tuple
	---@field sort_key             boolean                            # sort key of table
	---@field whitespace_brace     ""|" "|string                      # whitespace string around brace
	---@field whitespace_bracket   ""|" "|string                      # whitespace string around bracket
	---@field whitespace_operator  ""|" "|string                      # whitespace string around operator
	---@field whitespace_separator ""|" "|string                      # whitespace string around separator
	opt = {
		auto_join            = true,
		indent               = " ",
		join_length          = 20,
		metatable            = true,
		newline              = "\n",
		sep                  = ",",
		sep_tuple            = "\t",
		sort_key             = true,
		whitespace_brace     = "",
		whitespace_bracket   = " ",
		whitespace_operator  = " ",
		whitespace_separator = " ",
	},
	env = {
		force_expand = false,
		depth = 0,
		cache = PCache,
	},
}
Serializer.presets = {
	compact = {
		auto_join            = false,
		indent               = "",
		metatable            = false,
		newline              = "",
		sep                  = ",",
		sep_tuple            = "",
		sort_key             = true,
		whitespace_brace     = "",
		whitespace_bracket   = "",
		whitespace_operator  = "",
		whitespace_separator = "",
	},
	pretty = {
		auto_join            = true,
		indent               = "\t",
		join_length          = 100,
		metatable            = true,
		sep                  = ", ",
		sep_tuple            = "\t",
		sort_key             = true,
		whitespace_brace     = " ",
		whitespace_bracket   = " ",
		whitespace_operator  = " ",
		whitespace_separator = " ",
	},
	static = {
		auto_join            = true,
		indent               = "  ",
		join_length          = 100,
		metatable            = true,
		sep                  = ", ",
		sep_tuple            = "\t",
		sort_key             = true,
		whitespace_brace     = " ",
		whitespace_bracket   = " ",
		whitespace_operator  = " ",
		whitespace_separator = " ",
	},
	default = Serializer.opt
}

function Serializer:_is_join()
	return self.opt.auto_join and not self.env.force_expand
end

function Serializer:_get_indent(x)
	return self.opt.indent:rep(x)
end

function Serializer._get_env()
	return {
		force_expand = false,
		depth = 0,
		cache = PCache.new()
	}
end

---@param option
---| "compact"
---| "pretty"
---| "static"
---| "default"
---| HC.keyset.serialize_flags
function Serializer.new(option)
	local obj = HC.Class.new(Serializer)
	if type(option) == "string" then
		option = Serializer.presets[option]
	end
	if option == nil then
		option = {}
	end
	obj.opt = setmetatable(option, { __index = Serializer.opt })
	obj:reset()
	return obj
end

function Serializer:reset()
	self.env = Serializer._get_env()
	--- Each reference has a unique id and a reference count.
	self.refs = {}
	--- Each value type has a unique id list for reference counting.
	self.ref_type_id = {}
end

function Serializer:serialize(x)
	local ret = self:_serialize(x)
	return ret
end

function Serializer:serialize_packed(args)
	local ret = {}
	for i = 1, args.n do
		local v = args[i]
		table.insert(ret, self:_serialize(v))
	end
	return table.concat(ret, self.opt.sep_tuple)
end

function Serializer:serialize_varargs(...)
	local ret = {}
	local varargs = HC.packlen(...)
	for i = 1, varargs.n do
		local v = varargs[i]
		table.insert(ret, self:_serialize(v))
	end
	return HC.unpacklen(ret)
end

function Serializer:_atom(x)
	if type(x) == "string" then
		return string.format("%q", x)
	else
		return tostring(x)
	end
end

--- Counting reference.
function Serializer:_ref(x)
	local refs = self.refs
	local _type = type(x)
	local ref_key = _type .. ":" .. tostring(x)
	local ref = refs[ref_key]

	if ref == nil then
		local ref_type_id = self.ref_type_id
		ref_type_id[_type] = (ref_type_id[_type] or 0) + 1

		ref = { id = ref_type_id[_type], count = 0 }
		refs[ref_key] = ref
	end

	ref.count = ref.count + 1
	return ref
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
		sep_tuple            = "\t",
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

--- 序列化任意值
---@param x any 要序列化的值
---@return string 序列化结果
function Serializer:serialize(x)
	return self:_serialize(x)
end

function Serializer:serialize_packed(args)
	local ret = { n = args.n }
	for i = 1, args.n do
		local v = args[i]
		table.insert(ret, self:_serialize(v))
	end
	return table.concat(ret, self.opt.sep_tuple)
end

function Serializer:serialize_varargs(...)
	local varargs = HC.packlen(...)
	local ret = { n = varargs.n }
	for i = 1, varargs.n do
		local v = varargs[i]
		table.insert(ret, self:_serialize(v))
	end
	return HC.unpacklen(ret)
end

--- 序列化元组
---@param ... any 要序列化的值
---@return string 序列化结果
function Serializer:serialize_varargs(...)
	local ret = {}
	for i = 1, select("#", ...) do
		table.insert(ret, self:_serialize(select(i, ...)))
	end
	return table.concat(ret, self.opt.sep_tuple)
end

--- 内部序列化逻辑
---@param x any 要序列化的值
---@return string 序列化结果
function Serializer:_serialize(x)
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
		local sv = self:_serialize(v)
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
		local sv = self:_serialize(v)
		local entry = sk .. opt.whitespace_operator .. opt.field .. opt.whitespace_operator .. sv
		table.insert(parts, entry)
		len = len + #entry
	end
	-- 处理元表
	if opt.metatable then
		local mt = getmetatable(x)
		if mt then
			local sk = self:_key("<metatable>")
			local sv = self:_serialize(mt)
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
	return opt.bracket[1] .. opt.whitespace_bracket .. self:_serialize(k) .. opt.whitespace_bracket .. opt.bracket[2]
end

local IS_NIL = setmetatable({}, { __tostring = "Nil" })
local IS_NAN = setmetatable({}, { __tostring = "NaN" })

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

---@param option HC.keyset.serialize_flags?
function HC.serialize(x, option)
	return Serializer.new(option):serialize(x)
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
			table.insert(buffer, lib996:serialize_minimal(v))
			table.insert(buffer, ",")
		end
		for k, v in pairs(obj) do
			if not (type(k) == "number" and k >= 1 and k <= max and math.floor(k) == k) then
				if type(k) ~= "string" or not string.find(k, "[A-Za-z_][A-Za-z0-9_]*") then
					k = lib996:serialize_minimal(k)
					k = "[" .. k .. "]"
				end
				table.insert(buffer, k .. "=" .. lib996:serialize_minimal(v))
				table.insert(buffer, ",")
			end
		end
		buffer[#buffer] = nil
		table.insert(buffer, "}")
	else
		error("can not serialize a " .. t .. " type.")
	end
	return table.concat(buffer)
end

if HC.is_client then
	local function clear()
		for k, _ in pairs(package.loaded) do
			if string.find(k, "^/game/")
			or string.find(k, "scripts", 1, true) == 1
			or string.find(k, "GUILayout", 1, true) == 1
			then
				package.loaded[k] = nil
				_G[k] = nil
			end
		end
	end
	SL:RegisterLUAEvent(LUA_EVENT_LEAVE_WORLD, "HC", function()
		SL:Print("小退释放缓存")
		clear()
	end)
	local html_escape = {
		["<"] = "&lt;",
		[">"] = "&gt;",
	}
	local function format_system_tips(...)
		return HC.Serializer.new("compact")
						:serialize_varargs(...)
						:gsub("[<>]", html_escape)
	end
	SL:RegisterLUAEvent(LUA_EVENT_TALKTONPC, "HC", function(...)
		SL:ShowSystemTips(format_system_tips(...))
	end)
end

if HC.is_server then
	local patched = {
		handlerequest = true,
		clicknpc = true,
	}
	local handlers = {}
	setmetatable(_G, {
		__index = function(t, k)
			if patched[k] then
				return function(...)
					for i, v in ipairs(handlers[k] or {}) do
						xpcall(v, HC.print, ...)
					end
				end
			end
			return rawget(t, k)
		end,
		__newindex = function(t, k, v)
			if patched[k] then
				handlers[k] = handlers[k] or {}
				table.insert(handlers[k], v)
				return
			end
			rawset(t, k, v)
		end,
	})

	function handlerequest(actor, msgid, methodid, param2, param3, msg)
		HC.print("handlerequest", actor, msgid, methodid, param2, param3, msg)
	end
end

Server = {}
Client = {}


if HC.is_server then
	-- call client function in server
	-- Client[actor].Console.init()
	local function node(actor, keys)
		return setmetatable({}, {
			__index = function(_, k)
				local new_keys = HC.deepcopy(keys)
				table.insert(new_keys, k)
				return node(actor, new_keys)
			end,
			__call = function(_, ...)
				sendluamsg(actor, -2 ^ 31, 0, 0, HC.serialize_minimal({ keys, { ... } }))
			end
		})
	end
	setmetatable(Client, {
		__index = function(_, actor)
			return node(actor, {})
		end,
	})
	function handlerequest(actor, msgid, _, _, _, data)
		if msgid ~= -2 ^ 31 then
			return
		end
		data = HC.runcode("return " .. data)
		local module, method, args = HC.unpack(data)
		Server[module][method](actor, unpack(args))
	end
elseif HC.is_client then
	local function node(keys)
		return setmetatable({}, {
			__index = function(_, k)
				local new_keys = HC.deepcopy(keys)
				table.insert(new_keys, k)
				return node(new_keys)
			end,
			__call = function(_, ...)
				SL:SendLuaNetMsg(-2 ^ 31, 0, 0, 0, HC.serialize_minimal({ keys, { ... } }))
			end,
		})
	end
	-- call server function in client
	-- Server.Console.main(actor)
	setmetatable(Server, {
		__index = function(_, k)
			return node({ k })
		end,
	})
	SL:RegisterLuaNetMsg(-2 ^ 31, function(msgid, _, _, _, data)
		if msgid ~= -2 ^ 31 then
			return
		end
		data = HC.runcode("return " .. data)
		local module, method, args = HC.unpack(data)
		Client[module][method](unpack(args))
	end)
end

if HC.is_client then
	local ui = {}
	function ui.init(parent)
		local Node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
		GUI:setTag(Node, -1)

		-- Create ImageView
		local ImageView = GUI:Image_Create(Node, "ImageView", 0.00, 0.00, "res/public/bg_npc_08.jpg")
		GUI:Image_setScale9Slice(ImageView, 10, 10, 10, 10)
		GUI:setContentSize(ImageView, 1000, 600)
		GUI:setIgnoreContentAdaptWithSize(ImageView, false)
		GUI:setAnchorPoint(ImageView, 0.50, 0.50)
		GUI:setTouchEnabled(ImageView, false)
		GUI:setTag(ImageView, -1)

		-- Create ListView
		local ListView = GUI:ListView_Create(Node, "ListView", 0.00, 0.00, 1000.00, 600.00, 1)
		GUI:ListView_setBackGroundColorType(ListView, 1)
		GUI:ListView_setBackGroundColor(ListView, "#9696ff")
		GUI:ListView_setBackGroundColorOpacity(ListView, 100)
		GUI:ListView_setGravity(ListView, 5)
		GUI:setAnchorPoint(ListView, 0.50, 0.50)
		GUI:setOpacity(ListView, 25)
		GUI:setTouchEnabled(ListView, true)
		GUI:setTag(ListView, -1)
	end

	local Console = {}
	function Console.init()
		local w, h = SL:GetMetaValue("SCREEN_WIDTH"), SL:GetMetaValue("SCREEN_HEIGHT")
		local window = GUI:Win_Create("Commandline", w / 2, h / 2, 0, 0)
		GUI:Timeline_Window3(window)
		ui.init(window)
	end

	GUI:addKeyboardEvent({ "KEY_CTRL", "KEY_0" }, function()
		Console.init()
	end)
	Client.Console = Console
elseif HC.is_server then
	Console = {}
	function Console.main(actor)
	end

	Server.Console = Console
end



--- ---
--- 执行延迟调用
--- ---
for _, fn in ipairs(defer) do
	fn()
end


return HC
