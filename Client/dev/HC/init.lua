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
	return pcall(fn)
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
		local append_args = HC.packlen(...)
		table.move(append_args, 1, append_args.n, args.n + 1, args)
		args.n = args.n + append_args.n
		return pipe(fn(HC.unpacklen(args)))
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

if HC.is_server then
	local patch = {}
	local handlers = {}
	setmetatable(_G, {
		__newindex = function(t, k, v)
			if patch[k] then
				handlers[k] = handlers[k] or {}
				table.insert(handlers[k], v)
				local fn = function(...)
					for _, v in ipairs(handlers[k]) do
						xpcall(v, print, ...)
					end
				end
				rawset(t, k, fn)
				return
			end
			rawset(t, k, v)
		end,
	})

	patch.handlerequest = true
	function handlerequest(...)
		print(...)
	end
end

ColorTab = {
	[0] = "#000000",
	[1] = "#800000",
	[2] = "#008000",
	[3] = "#808000",
	[4] = "#000080",
	[5] = "#800080",
	[6] = "#008080",
	[7] = "#c0c0c0",
	[8] = "#558097",
	[9] = "#9db9c8",
	[10] = "#7b7373",
	[11] = "#2d2929",
	[12] = "#5a5252",
	[13] = "#635a5a",
	[14] = "#423939",
	[15] = "#1d1818",
	[16] = "#181010",
	[17] = "#291818",
	[18] = "#100808",
	[19] = "#f27971",
	[20] = "#e1675f",
	[21] = "#ff5a5a",
	[22] = "#ff3131",
	[23] = "#d65a52",
	[24] = "#941000",
	[25] = "#942918",
	[26] = "#390800",
	[27] = "#731000",
	[28] = "#b51800",
	[29] = "#bd6352",
	[30] = "#421810",
	[31] = "#ffaa99",
	[32] = "#5a1000",
	[33] = "#733929",
	[34] = "#a54a31",
	[35] = "#947b73",
	[36] = "#bd5231",
	[37] = "#522110",
	[38] = "#7b3118",
	[39] = "#2d1810",
	[40] = "#8c4a31",
	[41] = "#942900",
	[42] = "#bd3100",
	[43] = "#c67352",
	[44] = "#6b3118",
	[45] = "#c66b42",
	[46] = "#ce4a00",
	[47] = "#a56339",
	[48] = "#5a3118",
	[49] = "#2a1000",
	[50] = "#150800",
	[51] = "#3a1800",
	[52] = "#080000",
	[53] = "#290000",
	[54] = "#4a0000",
	[55] = "#9d0000",
	[56] = "#dc0000",
	[57] = "#de0000",
	[58] = "#fb0000",
	[59] = "#9c7352",
	[60] = "#946b4a",
	[61] = "#734a29",
	[62] = "#523118",
	[63] = "#8c4a18",
	[64] = "#884411",
	[65] = "#4a2100",
	[66] = "#211810",
	[67] = "#d6945a",
	[68] = "#c66b21",
	[69] = "#ef6b00",
	[70] = "#ff7700",
	[71] = "#a59484",
	[72] = "#423121",
	[73] = "#181008",
	[74] = "#291808",
	[75] = "#211000",
	[76] = "#392918",
	[77] = "#8c6339",
	[78] = "#422910",
	[79] = "#6b4218",
	[80] = "#7b4a18",
	[81] = "#944a00",
	[82] = "#8c847b",
	[83] = "#6b635a",
	[84] = "#4a4239",
	[85] = "#292118",
	[86] = "#463929",
	[87] = "#b5a594",
	[88] = "#7b6b5a",
	[89] = "#ceb194",
	[90] = "#a58c73",
	[91] = "#8c735a",
	[92] = "#b59473",
	[93] = "#d6a573",
	[94] = "#efa54a",
	[95] = "#efc68c",
	[96] = "#7b6342",
	[97] = "#6b5639",
	[98] = "#bd945a",
	[99] = "#633900",
	[100] = "#d6c6ad",
	[101] = "#524229",
	[102] = "#946318",
	[103] = "#efd6ad",
	[104] = "#a58c63",
	[105] = "#635a4a",
	[106] = "#bda57b",
	[107] = "#5a4218",
	[108] = "#bd8c31",
	[109] = "#353129",
	[110] = "#948463",
	[111] = "#7b6b4a",
	[112] = "#a58c5a",
	[113] = "#5a4a29",
	[114] = "#9c7b39",
	[115] = "#423110",
	[116] = "#efad21",
	[117] = "#181000",
	[118] = "#292100",
	[119] = "#9c6b00",
	[120] = "#94845a",
	[121] = "#524218",
	[122] = "#6b5a29",
	[123] = "#7b6321",
	[124] = "#9c7b21",
	[125] = "#dea500",
	[126] = "#5a5239",
	[127] = "#312910",
	[128] = "#cebd7b",
	[129] = "#635a39",
	[130] = "#94844a",
	[131] = "#c6a529",
	[132] = "#109c18",
	[133] = "#428c4a",
	[134] = "#318c42",
	[135] = "#109429",
	[136] = "#081810",
	[137] = "#081818",
	[138] = "#082910",
	[139] = "#184229",
	[140] = "#a5b5ad",
	[141] = "#6b7373",
	[142] = "#182929",
	[143] = "#18424a",
	[144] = "#31424a",
	[145] = "#63c6de",
	[146] = "#44ddff",
	[147] = "#8cd6ef",
	[148] = "#736b39",
	[149] = "#f7de39",
	[150] = "#f7ef8c",
	[151] = "#f7e700",
	[152] = "#6b6b5a",
	[153] = "#5a8ca5",
	[154] = "#39b5ef",
	[155] = "#4a9cce",
	[156] = "#3184b5",
	[157] = "#31526b",
	[158] = "#deded6",
	[159] = "#bdbdb5",
	[160] = "#8c8c84",
	[161] = "#f7f7de",
	[162] = "#000818",
	[163] = "#081839",
	[164] = "#081029",
	[165] = "#081800",
	[166] = "#082900",
	[167] = "#0052a5",
	[168] = "#007bde",
	[169] = "#10294a",
	[170] = "#10396b",
	[171] = "#10528c",
	[172] = "#215aa5",
	[173] = "#10315a",
	[174] = "#104284",
	[175] = "#315284",
	[176] = "#182131",
	[177] = "#4a5a7b",
	[178] = "#526ba5",
	[179] = "#293963",
	[180] = "#104ade",
	[181] = "#292921",
	[182] = "#4a4a39",
	[183] = "#292918",
	[184] = "#4a4a29",
	[185] = "#7b7b42",
	[186] = "#9c9c4a",
	[187] = "#5a5a29",
	[188] = "#424214",
	[189] = "#393900",
	[190] = "#595900",
	[191] = "#ca352c",
	[192] = "#6b7321",
	[193] = "#293100",
	[194] = "#313910",
	[195] = "#313918",
	[196] = "#424a00",
	[197] = "#526318",
	[198] = "#5a7329",
	[199] = "#314a18",
	[200] = "#182100",
	[201] = "#183100",
	[202] = "#183910",
	[203] = "#63844a",
	[204] = "#6bbd4a",
	[205] = "#63b54a",
	[206] = "#63bd4a",
	[207] = "#5a9c4a",
	[208] = "#4a8c39",
	[209] = "#63c64a",
	[210] = "#63d64a",
	[211] = "#52844a",
	[212] = "#317329",
	[213] = "#63c65a",
	[214] = "#52bd4a",
	[215] = "#10ff00",
	[216] = "#182918",
	[217] = "#4a884a",
	[218] = "#4ae74a",
	[219] = "#005a00",
	[220] = "#008800",
	[221] = "#009400",
	[222] = "#00de00",
	[223] = "#00ee00",
	[224] = "#00fb00",
	[225] = "#4a5a94",
	[226] = "#6373b5",
	[227] = "#7b8cd6",
	[228] = "#6b7bd6",
	[229] = "#7788ff",
	[230] = "#c6c6ce",
	[231] = "#94949c",
	[232] = "#9c94c6",
	[233] = "#313139",
	[234] = "#291884",
	[235] = "#180084",
	[236] = "#4a4252",
	[237] = "#52427b",
	[238] = "#635a73",
	[239] = "#ceb5f7",
	[240] = "#8c7b9c",
	[241] = "#7722cc",
	[242] = "#ddaaff",
	[243] = "#f0b42a",
	[244] = "#df009f",
	[245] = "#e317b3",
	[246] = "#fffbf0",
	[247] = "#a0a0a4",
	[248] = "#808080",
	[249] = "#ff0000",
	[250] = "#00ff00",
	[251] = "#ffff00",
	[252] = "#0000ff",
	[253] = "#ff00ff",
	[254] = "#00ffff",
	[255] = "#ffffff",
}

---@param str string # 提示字符串
---@param actor? string # 服务端需要传入 actor
---@param color? string | integer # 颜色
function HC.tips(str, actor, color)
	assert_type("actor", actor, { "string", "number" }, true, 2)
	color = color or "#FFFFFF"
	if HC.is_client then
		if type(color) == "number" then
			color = SL:GetHexColorByStyleId(color)
		end
		SL:ShowSystemTips(("<font color='%s'>%s</font>"):format(color, str))
	else
		if type(color) == "number" then
			color = ColorTab[color]
		end
		sendmsg(actor, 1, tbl2json({ Msg = ("<font color='%s'>%s</font>"):format(color, str), Type = 9 }))
	end
end

function HC.encode(x)
	if HC.is_client then
		return SL:JsonEncode(x)
	else
		return tbl2json(x)
	end
end

function HC.decode(x)
	if HC.is_client then
		return SL:JsonDecode(x)
	else
		return json2tbl(x)
	end
end

function HC.log(msg, actor)
	if HC.is_server then
		print(("Player: %s, ID: %s, %s"):format(getbaseinfo(actor, 1), getbaseinfo(actor, 2), msg))
	elseif HC.is_client then
		print(("Player: %s, ID: %s, %s"):format(Meta["USER_NAME"], Meta["USER_ID"], msg))
	end
end

---@param jobs fun(callback:function)[] # 接收回调的任务列表
function Job(jobs)
	local i = 0
	local function job()
		i = i + 1
		local v = jobs[i]
		if v then
			v(job)
		end
	end
	job()
end

Reg = setmetatable({}, { __index = function(_, k) return k end })


--- ---
--- 执行延迟调用
--- ---
defer.run()

return HC
