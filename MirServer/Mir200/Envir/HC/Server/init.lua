VarType = {
	A = function(id) return ("A" .. id) end, ---@return string �ַ���ϵͳ���� ��������������500�� (A0 - A499) ����� Mir200/GlobalVal.ini �ļ�����
	G = function(id) return ("G" .. id) end, ---@return number ������ϵͳ���� ��������������500�� (G0 - G499) ����� Mir200/GlobalVal.ini �ļ�����
	I = function(id) return ("I" .. id) end, ---@return number ��ʱ������ϵͳ���� ����������������.100�� (I0 - I99)
	S = function(id) return ("S" .. id) end, ---@return string ��ʱ�ַ��͸��˱���	���߲�����.100�� (S0 - S99)
	D = function(id) return ("D" .. id) end, ---@return number ��ʱ�����͸��˱���	���߲�����.100�� (D0 - D99)ҡ���ӱ���
	N = function(id) return ("N" .. id) end, ---@return number ��ʱ�����͸��˱���	���߲�����.100�� (N0 - N99)
	M = function(id) return ("M" .. id) end, ---@return number ��ʱ�����͸��˱���	���߲�����.100�� (M0 - M99)�л���ͼ���
	U = function(id) return ("U" .. id) end, ---@return number �����͸��˱���	�ɱ���.255�� (U0 - U254)���ֵ21��
	T = function(id) return ("T" .. id) end, ---@return string �ַ��͸��˱���	�ɱ���.255�� (T0 - T254)��󳤶�8000�ַ�������
	J = function(id) return ("J" .. id) end, ---@return number ���������͸��˱���	�ɱ���.ÿ���Զ�12������,�������ͣ���������00:00��.500�� (J0 - J499)
	Z = function(id) return ("Z" .. id) end, ---@return string �����ַ��͸��˱���	�ɱ���.ÿ���Զ�12������,�������ͣ���������00:00��.500�� (Z0 - Z499)
	P = function(id) return ("P" .. id) end, ---@return number NPC�����͸��˱���	���ڵ�ǰNPC��Ч.��Close�Ի�ʱ.����P��������.100�� (P0 - P99)
	B = function(id) return ("B" .. id) end, ---@return number ���������͸��˱���	�ɱ���.���֧��19λ��,���ô���ֵ����.100�� (B0 - B99)
	F = function(id) return (id) end, ---@return 0|1 ����λ���˱��	�ɱ���,�ñ���ֻ��0��1������״̬
}

---@class SysVar
SysVar = {
	open_timing = VarType.G(0), -- ����ʱ���
	merge_count = VarType.G(1), -- ��������
}
---@class PlayDef
PlayDef = {}

-- ���˱�� 	�����͸��˱��� 	�ɱ���,�ñ���ֻ��0��1������״̬
---@class PlayFlag
PlayFlag = {
	enter_game = VarType.F(1),
}

---@class SysVar
Global = setmetatable({}, {
	__index = function(_, k)
		k = SysVar[k]
		return getsysvar(k)
	end,
	__newindex = function(_, k, v)
		k = SysVar[k]
		return setsysvar(k, v)
	end
})

local _PlayVar = {
	__index = function(t, k)
		local actor = rawget(t, 1)
		k = PlayFlag[k] or PlayDef[k]
		if type(k) == "number" then
			return getflagstatus(actor, k)
		else
			return getplaydef(actor, k)
		end
	end,
	__newindex = function(t, k, v)
		local actor = rawget(t, 1)
		k = PlayFlag[k] or PlayDef[k]
		if type(k) == "number" then
			return setflagstatus(actor, k, v)
		else
			return setplaydef(actor, k, v)
		end
	end
}

---@return PlayDef|PlayFlag
PlayVar = function(actor)
	assert_type("actor", actor, "string", false, 1)
	return setmetatable({ actor }, _PlayVar)
end


Event = {}
Event.events = {}
function Event.add(event, opts)
	opts = opts or {}
	assert_type("opts", opts, "table", false, 1)
	assert_type("opts.fn", opts.fn, "function", false, 1)
	assert_type("opts.priority", opts.priority, "number", true, 1)
	Event.events[event] = Event.events[event] or {}
	local listeners = Event.events[event]
	if next(listeners) == nil then
		print("ע���¼�", event)
	end
	local pos = #listeners + 1
	for _, v in ipairs(listeners) do
		if (opts.priority or 0) >= v.priority then
			pos = pos - 1
			break
		end
	end
	table.insert(Event.events[event], pos, { fn = opts.fn, priority = opts.priority or 0 })
end

function Event.push(event, ...)
	local listeners = Event.events[event]
	if not listeners then
		return
	end
	local ret
	for _, v in pairs(listeners) do
		local r = HC.packlen(v.fn(...))
		if r[1] == true then
			ret = r
			break
		end
	end
	if ret then
		return unpack(ret, 2, ret.n)
	end
end

function Event.register(event, opts)
	assert_type("event", event, "string", nil, 1)
	_G[event] = function(...)
		print("�����¼�", event)
		return Event.push(event, ...)
	end
	if opts then
		Event.add(event, opts)
	end
end

---@type table<string,string>
Export = setmetatable({}, {
	__index = function(_, k)
		return "@" .. k
	end,
	__newindex = function(_, k, v)
		if not _G[k] then
			_G[k] = v
		end
	end
})

--- �����پ���
function get_distance(a, b)
	return math.abs(b[1] - a[1]) + math.abs(b[2] - a[2])
end

--- �ѿ�������
function get_distance2(a, b)
	return math.sqrt((a[1] - b[1]) ^ 2 + (a[2] - b[2]) ^ 2)
end

---@param a string
---@param b string
---@param r number
---@return boolean
function check_range(a, b, r)
	if getbaseinfo(a, 3) ~= getbaseinfo(b, 3) then
		return false
	end
	local ax = getbaseinfo(a, 4)
	local ay = getbaseinfo(a, 5)
	local bx = getbaseinfo(b, 4)
	local by = getbaseinfo(b, 5)
	return math.abs(bx - ax) <= r and math.abs(by - ay) <= r
end

local npc_info_lookup = {}
local npc_info_list = {}
local readPath = "../DATA/cfg_npclist.xls"
local config = readexcel(readPath)
for _, cfg in ipairs(config or {}) do
	local id = tonumber(cfg[0])
	if type(cfg) == "table" and id ~= nil then
		local npc = getnpcbyindex(id)
		if npc then
			local script = cfg[1]
			local name = getbaseinfo(npc, 1)
			---@class npcinfo
			local info = {
				npc = npc,
				id = id,
				script = script,
				name = name,
			}
			npc_info_lookup[id] = info
			npc_info_lookup[npc] = info
			npc_info_lookup[name] = info
			table.insert(npc_info_list, info)
		end
	end
end

---@return npcinfo
function get_npc_info(name)
	return npc_info_lookup[name]
end

---@return npcinfo[]
function get_all_npc_info()
	return npc_info_list
end

---@param scripts string[]
---@return integer[]
function get_all_script_npc(scripts)
	local ret = {}
	for _, info in ipairs(npc_info_list) do
		for _, script in ipairs(scripts) do
			if info.script == script then
				table.insert(ret, info.id)
			end
		end
	end
	return ret
end

---@param actor string
---@param npc_names (string|integer)[] # npcid name or script list
---@param range? number # default 10
---@param msg? boolean|string # true: default message, string: custom message
function check_npcs_in_range(actor, npc_names, range, msg)
	range = range or 10
	for _, name in ipairs(npc_names) do
		local npc = get_npc_info(name).npc
		if npc and check_range(actor, npc, range) then
			return true
		end
	end
	if msg then
		if msg == true then
			msg = "���� NPC ��Զ"
		end
		HC.tips(msg, actor, 249)
	end
	return false
end

local function node(keys, actor)
	return setmetatable({}, {
		__index = function(_, k)
			assert_type("key", k, "string")
			local new_keys = HC.deepcopy(keys)
			table.insert(new_keys, k)
			return node(new_keys, actor)
		end,
		__newindex = function(_, k, v)
			if HC.is_server then
				sendluamsg(actor, -2 ^ 31, 1, 0, 0, HC.encode({ keys, { k, v } }))
			end
			-- if HC.is_client then
			-- 	SL:SendLuaNetMsg(-2 ^ 31, 1, 0, 0, HC.encode({ keys, { k, v } }))
			-- end
		end,
		__call = function(_, ...)
			if HC.is_server then
				sendluamsg(actor, -2 ^ 31, 0, 0, 0, HC.encode({ keys, { ... } }))
			elseif HC.is_client then
				SL:SendLuaNetMsg(-2 ^ 31, 0, 0, 0, HC.encode({ keys, { ... } }))
			end
		end,
	})
end

-- call client function in server
-- Clients[actor].Console.init()
---@class Clients
---@field [string] Client
Clients = setmetatable({}, {
	__index = function(_, actor)
		return node({}, actor)
	end,
})
-- server api register
---@class Server
Server = {}

Event.register(Reg.handlerequest, {
	fn = function(actor, msgid, _, _, _, data)
		if msgid ~= -2 ^ 31 then
			return
		end
		data = HC.decode(data)
		if type(data) ~= "table"
		or type(data[1]) ~= "table"
		or type(data[2]) ~= "table"
		then
			return
		end
		local keys, args = data[1], data[2]
		local tmp = Server
		for _, v in ipairs(keys) do
			tmp = tmp[v]
			if tmp == nil
			or string.sub(v, 1, 1) == "_"
			then
				HC.log(("Invalid API call: %s"):format(table.concat(keys, ".")), actor)
				return
			end
		end
		tmp(actor, HC.unpack(args))
	end
})

local maps = {}
do
	local readPath = "Mapinfo.txt"
	local file = assert(io.open(readPath, "r"))
	for line in file:lines() do
		if not line:find("^;") then
			local id, raw, name = line:match("%[(%S+)%s*|%s*(%S+)%s*(%S+)%]")
			if not id then
				id, name = line:match("%[(%S+)%s*(%S+)%]")
			end
			if id then
				---@class mapinfo
				local info = {
					id = id, raw = raw, name = name,
				}
				maps[id] = info
				maps[name] = info
			end
		end
	end
end

---@return mapinfo
function get_map_info(id)
	return maps[id] and maps[id]
end

---@generic T
---@param fn T
---@return T
function check_npc_warp(fn, npclist)
	return function(actor, ...)
		if check_npcs_in_range(actor, npclist, nil, true) then
			fn(actor, ...)
		end
	end
end

function client_run(actor, code)
	sendluamsg(actor, 0, 0, 0, 0, code)
end
