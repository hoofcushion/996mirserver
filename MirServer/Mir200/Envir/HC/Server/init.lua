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

local registered = {}
function Event.register(event, opts)
	assert_type("event", event, "string", nil, 1)
	if not registered[event] then
		registered[event] = true
		_G[event] = function(...)
			print("�����¼�", event)
			return Event.push(event, ...)
		end
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
		Common.tips(msg, actor, 249)
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
				Common.sendmsg(Msg.call, 1, 0, 0, Json.encode({ keys, { k, v } }), actor)
			end
		end,
		__call = function(_, ...)
			Common.sendmsg(Msg.call, 0, 0, 0, Json.encode({ keys, { ... } }), actor)
		end,
	})
end

-- call client function in server
-- Clients[actor].Console.init()
---@type table<string,Client>
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
		if msgid ~= Msg.call then
			return
		end
		data = Json.decode(data)
		if type(data) ~= "table"
		or type(data[1]) ~= "table"
		or type(data[2]) ~= "table"
		then
			return
		end
		local keys, args = data[1], data[2]
		Common.log(
			("Server API call: %s(%s)"):format(
				table.concat(keys, "."),
				table.concat(HC.map(args, HC.serialize_minimal), ", ")
			),
			actor)
		local tmp = Server
		for _, v in ipairs(keys) do
			tmp = tmp[v]
			if tmp == nil
			or string.sub(v, 1, 1) == "_"
			then
				Common.log(("Invalid API call: %s"):format(table.concat(keys, ".")), actor)
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

ItemObj = {
	makeindex = function(actor, itemobj) return getiteminfo(actor, itemobj, 1) end, ---@return integer # ��ƷΨһID
	index = function(actor, itemobj) return getiteminfo(actor, itemobj, 2) end, ---@return integer # ��ƷID
	dura = function(actor, itemobj) return getiteminfo(actor, itemobj, 3) end, ---@return integer # ��Ʒ�;ö�
	duramax = function(actor, itemobj) return getiteminfo(actor, itemobj, 4) end, ---@return integer # ��Ʒ����;ö�
	overlap = function(actor, itemobj) return getiteminfo(actor, itemobj, 5) end, ---@return integer # ��Ʒ����������
	bind = function(actor, itemobj) return getiteminfo(actor, itemobj, 6) end, ---@return boolean # ��Ʒ��״̬
	name = function(actor, itemobj) return getiteminfo(actor, itemobj, 7) end, ---@return string # ��Ʒ����
	newname = function(actor, itemobj) return getiteminfo(actor, itemobj, 8) end, ---@return string # ��Ʒ�����������
}



function get_item(actor, spec)
	local index = ItemStd.index(spec.id)
	local name = ItemStd.name(spec.id)
	if ItemStd.is_money(index) then
		if spec.bind == true then
			return querymoney(actor, ItemStd.index("��" .. name))
		elseif spec.bind == false then
			return querymoney(actor, index)
		elseif spec.bind == nil then
			return tonumber(getbindmoney(actor, name))
		end
	elseif ItemStd.is_title(index) then
		return checktitle(actor, ItemStd.name(index)) and 1 or 0
	else
		return math.max(getbagitemcount(actor, name), 0)
	end
end

function check_item(actor, spec, factor)
	factor = factor or 1
	local need = spec.count or 1
	need = need * factor

	local index = ItemStd.index(spec.id)
	local name = ItemStd.name(spec.id)
	local has = get_item(actor, spec)
	if spec.makeindex and type(spec.id) == "number" then
		success = has >= need
	elseif ItemStd.is_money(index) then
		success = has >= need
	elseif ItemStd.is_title(index) then
		success = has >= 0
	else
		success = has >= need
	end
	if not success then
		return false, name, need, has
	end
	return true, name, need, has
end

local bindrule = ItemRule.serialize({
	no_drop = true,
	drop_disappear = true,
	spill_disappear = true,
	no_trade = true,
	no_auction = true,
	no_sell = true,
})


function give_item(actor, spec, factor, log)
	factor = factor or 1
	local give = spec.count or 1
	give = give * factor
	log = spec.log or log

	local index = ItemStd.index(spec.id)
	local name = ItemStd.name(spec.id)
	if ItemStd.is_money(index) then
		if spec.bind == true then
			changemoney(actor, ItemStd.index("��" .. name), "+", give, log, true)
		else
			changemoney(actor, index, "+", give, log, true)
		end
	elseif ItemStd.is_title(index) then
		confertitle(actor, name, 1)
	else
		local rule = spec.rule
		if spec.bind == true then
			rule = bindrule
		end
		giveitem(actor, name, give, rule, log)
	end
end

function take_item(actor, spec, factor, log)
	factor = factor or 1
	local take = spec.count or 1
	take = take * factor
	log = spec.log or log

	local index = ItemStd.index(spec.id)
	local name = ItemStd.name(spec.id)
	if ItemStd.is_money(index) then
		if spec.bind == true then
			changemoney(actor, ItemStd.index("��" .. name), "-", take, log, true)
		elseif spec.bind == false then
			changemoney(actor, index, "-", take, log, true)
		elseif spec.bind == nil then
			consumebindmoney(actor, name, take, log)
		end
	elseif ItemStd.is_title(index) then
		deprivetitle(actor, name)
	else
		takeitem(actor, name, take, 0, log)
	end
end

---@param items ItemSpec[]
---@param factor number  # ��Ʒ����
---@param actor string
---@return boolean success
---@return string
function check_items(actor, items, factor)
	factor = factor or 1
	for _, spec in ipairs(items) do
		local bind = spec.bind or nil
		local success, itemname, need, has = check_item(actor, spec, factor)
		if not success then
			return false, ("%s%s ����, ��Ҫ %d ��, ֻ�� %d ��"):format(bind and "�� " or "", itemname, need, has)
		end
	end
	return true, ""
end

function give_items(actor, items, factor, log)
	factor = factor or 1
	for _, spec in ipairs(items) do
		give_item(actor, spec, factor, log)
	end
end

function take_items(actor, items, factor, log)
	factor = factor or 1
	for _, spec in ipairs(items) do
		take_item(actor, spec, factor, log)
	end
	return true
end
