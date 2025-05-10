local patch={
	handlerequest=true,
}
local handlers={}
local index={}
setmetatable(_G,{
	__index=function(t,k)
		return index[k] or rawget(t,k)
	end,
	__newindex=function(t,k,v)
		if patch[k] then
			handlers[k]=handlers[k] or {}
			table.insert(handlers[k],v)
			index[k]=function(...)
				for _,v in ipairs(handlers[k]) do
					xpcall(v,print,...)
				end
			end
			return
		end
		rawset(t,k,v)
	end,
})
VarType={
	A=function(id) return ("A"..id) end, ---@return string �ַ���ϵͳ���� ��������������500�� (A0 - A499) ����� Mir200/GlobalVal.ini �ļ�����
	G=function(id) return ("G"..id) end, ---@return number ������ϵͳ���� ��������������500�� (G0 - G499) ����� Mir200/GlobalVal.ini �ļ�����
	I=function(id) return ("I"..id) end, ---@return number ��ʱ������ϵͳ���� ����������������.100�� (I0 - I99)
	S=function(id) return ("S"..id) end, ---@return string ��ʱ�ַ��͸��˱���	���߲�����.100�� (S0 - S99)
	D=function(id) return ("D"..id) end, ---@return number ��ʱ�����͸��˱���	���߲�����.100�� (D0 - D99)ҡ���ӱ���
	N=function(id) return ("N"..id) end, ---@return number ��ʱ�����͸��˱���	���߲�����.100�� (N0 - N99)
	M=function(id) return ("M"..id) end, ---@return number ��ʱ�����͸��˱���	���߲�����.100�� (M0 - M99)�л���ͼ���
	U=function(id) return ("U"..id) end, ---@return number �����͸��˱���	�ɱ���.255�� (U0 - U254)���ֵ21��
	T=function(id) return ("T"..id) end, ---@return string �ַ��͸��˱���	�ɱ���.255�� (T0 - T254)��󳤶�8000�ַ�������
	J=function(id) return ("J"..id) end, ---@return number ���������͸��˱���	�ɱ���.ÿ���Զ�12������,�������ͣ���������00:00��.500�� (J0 - J499)
	Z=function(id) return ("Z"..id) end, ---@return string �����ַ��͸��˱���	�ɱ���.ÿ���Զ�12������,�������ͣ���������00:00��.500�� (Z0 - Z499)
	P=function(id) return ("P"..id) end, ---@return number NPC�����͸��˱���	���ڵ�ǰNPC��Ч.��Close�Ի�ʱ.����P��������.100�� (P0 - P99)
	B=function(id) return ("B"..id) end, ---@return number ���������͸��˱���	�ɱ���.���֧��19λ��,���ô���ֵ����.100�� (B0 - B99)
	F=function(id) return (id) end, ---@return 0|1 ����λ���˱��	�ɱ���,�ñ���ֻ��0��1������״̬
}
---@class SysVar
SysVar={
	open_timing=VarType.G(0), -- ����ʱ���
	merge_count=VarType.G(1), -- ��������
}
---@class PlayDef
PlayDef={}
-- ���˱�� 	�����͸��˱��� 	�ɱ���,�ñ���ֻ��0��1������״̬
---@class PlayFlag
PlayFlag={
	enter_game=VarType.F(1),
}
---@class SysVar
Global=setmetatable({},{
	__index=function(_,k)
		k=SysVar[k]
		return getsysvar(k)
	end,
	__newindex=function(_,k,v)
		k=SysVar[k]
		return setsysvar(k,v)
	end,
})
local _PlayVar={
	__index=function(t,k)
		local actor=rawget(t,1)
		k=PlayFlag[k] or PlayDef[k]
		if type(k)=="number" then
			return getflagstatus(actor,k)
		else
			return getplaydef(actor,k)
		end
	end,
	__newindex=function(t,k,v)
		local actor=rawget(t,1)
		k=PlayFlag[k] or PlayDef[k]
		if type(k)=="number" then
			return setflagstatus(actor,k,v)
		else
			return setplaydef(actor,k,v)
		end
	end,
}
---@return PlayDef|PlayFlag
PlayVar=function(actor)
	assert_type("actor",actor,"string",false,1)
	return setmetatable({actor},_PlayVar)
end
---@type table<string,string>
Export=setmetatable({},{
	__index=function(_,k)
		return "@"..k
	end,
	__newindex=function(_,k,v)
		if not _G[k] then
			_G[k]=v
		end
	end,
})
--- �����پ���
function get_distance(a,b)
	return math.abs(b[1]-a[1])+math.abs(b[2]-a[2])
end
--- �ѿ�������
function get_distance2(a,b)
	return math.sqrt((a[1]-b[1])^2+(a[2]-b[2])^2)
end
---@param a string
---@param b string
---@param r number
---@return boolean
function check_range(a,b,r)
	if getbaseinfo(a,3)~=getbaseinfo(b,3) then
		return false
	end
	local ax=getbaseinfo(a,4)
	local ay=getbaseinfo(a,5)
	local bx=getbaseinfo(b,4)
	local by=getbaseinfo(b,5)
	return math.abs(bx-ax)<=r and math.abs(by-ay)<=r
end
local npc_info_lookup={}
local npc_info_list={}
local readPath="../DATA/cfg_npclist.xls"
local config=readexcel(readPath)
for _,cfg in ipairs(config or {}) do
	local id=tonumber(cfg[0])
	if type(cfg)=="table" and id~=nil then
		local npc=getnpcbyindex(id)
		if npc then
			local script=cfg[1]
			local name=getbaseinfo(npc,1)
			---@class npcinfo
			local info={
				npc=npc,
				id=id,
				script=script,
				name=name,
			}
			npc_info_lookup[id]=info
			npc_info_lookup[npc]=info
			npc_info_lookup[name]=info
			table.insert(npc_info_list,info)
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
	local ret={}
	for _,info in ipairs(npc_info_list) do
		for _,script in ipairs(scripts) do
			if info.script==script then
				table.insert(ret,info.id)
			end
		end
	end
	return ret
end
---@param actor string
---@param npc_names (string|integer)[] # npcid name or script list
---@param range? number # default 10
---@param msg? boolean|string # true: default message, string: custom message
function check_npcs_in_range(actor,npc_names,range,msg)
	range=range or 10
	for _,name in ipairs(npc_names) do
		local npc=get_npc_info(name).npc
		if npc and check_range(actor,npc,range) then
			return true
		end
	end
	if msg then
		if msg==true then
			msg="���� NPC ��Զ"
		end
		Common.tips(msg,actor,249)
	end
	return false
end
local function node(keys,actor)
	return setmetatable({},{
		__index=function(_,k)
			assert_type("key",k,"string")
			local new_keys=HC.deepcopy(keys)
			table.insert(new_keys,k)
			return node(new_keys,actor)
		end,
		__newindex=function(_,k,v)
			Common.log(
				("Client%s.%s=%s"):format(
					#keys>0 and "."..(table.concat(keys,".")) or "",
					tostring(k),
					tostring(v)
				),
				actor)
			if Common.is_server then
				Common.sendmsg(Msg.call,1,0,0,Json.encode({keys,{k,v}}),actor)
			end
		end,
		__call=function(_,...)
			Common.log(
				("Client call: %s(%s)"):format(
					table.concat(keys,"."),
					table.concat(HC.map({...},tostring),", ")
				),
				actor)
			Common.sendmsg(Msg.call,0,0,0,Json.encode({keys,{...}}),actor)
		end,
	})
end

-- call client function in server
-- Clients[actor].Console.init()
---@type table<string,Client>
Clients=setmetatable({},{
	__index=function(_,actor)
		return node({},actor)
	end,
})
-- server api register
---@class Server
Server={}
Event.register(Reg.handlerequest,{
	fn=function(actor,msgid,_,_,_,data)
		if msgid~=Msg.call then
			return
		end
		data=Json.decode(data)
		if type(data)~="table"
		or type(data[1])~="table"
		or type(data[2])~="table"
		then
			return
		end
		local keys,args=data[1],data[2]
		Common.log(
			("Server API call: %s(%s)"):format(
				table.concat(keys,"."),
				table.concat(HC.map(args,HC.serialize_minimal),", ")
			),
			actor)
		local tmp=Server
		for _,v in ipairs(keys) do
			tmp=tmp[v]
			if tmp==nil
			or string.sub(v,1,1)=="_"
			then
				Common.log(("Invalid API call: %s"):format(table.concat(keys,".")),actor)
				return
			end
		end
		tmp(actor,HC.unpack(args))
	end,
})
function Server.runcode(actor,code)
	Common.sendmsg(Msg.runcode,0,0,0,code,actor)
end
local maps={}
do
	local readPath="Mapinfo.txt"
	local file=assert(io.open(readPath,"r"))
	for line in file:lines() do
		if not line:find("^;") then
			local id,raw,name=line:match("%[(%S+)%s*|%s*(%S+)%s*(%S+)%]")
			if not id then
				id,name=line:match("%[(%S+)%s*(%S+)%]")
			end
			if id then
				---@class mapinfo
				local info={
					id=id,raw=raw,name=name,
				}
				maps[id]=info
				maps[name]=info
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
function check_npc_warp(fn,npclist)
	return function(actor,...)
		if check_npcs_in_range(actor,npclist,nil,true) then
			fn(actor,...)
		end
	end
end
function get_item(actor,spec)
	local index=ItemStd.index(spec.id)
	local name=ItemStd.name(spec.id)
	if ItemStd.is_money(index) then
		if spec.bind==true then
			return querymoney(actor,ItemStd.index("��"..name))
		elseif spec.bind==false then
			return querymoney(actor,index)
		elseif spec.bind==nil then
			return tonumber(getbindmoney(actor,name))
		end
	elseif ItemStd.is_title(index) then
		return checktitle(actor,ItemStd.name(index)) and 1 or 0
	else
		return math.max(getbagitemcount(actor,name),0)
	end
end
function check_item(actor,spec,factor)
	factor=factor or 1
	local need=spec.count or 1
	need=need*factor
	local index=ItemStd.index(spec.id)
	local name=ItemStd.name(spec.id)
	local has=get_item(actor,spec)
	if spec.makeindex and type(spec.id)=="number" then
		success=has>=need
	elseif ItemStd.is_money(index) then
		success=has>=need
	elseif ItemStd.is_title(index) then
		success=has>=1
	else
		success=has>=need
	end
	if not success then
		return false,name,need,has
	end
	return true,name,need,has
end
local bindrule=ItemRule.serialize({
	no_drop=true,
	drop_disappear=true,
	spill_disappear=true,
	no_trade=true,
	no_auction=true,
	no_sell=true,
})
function give_item(actor,spec,factor,log)
	factor=factor or 1
	local give=spec.count or 1
	give=give*factor
	log=spec.log or log
	local index=ItemStd.index(spec.id)
	local name=ItemStd.name(spec.id)
	if ItemStd.is_money(index) then
		if spec.bind==true then
			changemoney(actor,ItemStd.index("��"..name),"+",give,log,true)
		else
			changemoney(actor,index,"+",give,log,true)
		end
	elseif ItemStd.is_title(index) then
		confertitle(actor,name,1)
	else
		local rule=spec.rule
		if spec.bind==true then
			rule=bindrule
		end
		giveitem(actor,name,give,rule,log)
	end
end
function take_item(actor,spec,factor,log)
	factor=factor or 1
	local take=spec.count or 1
	take=take*factor
	log=spec.log or log
	local index=ItemStd.index(spec.id)
	local name=ItemStd.name(spec.id)
	if ItemStd.is_money(index) then
		if spec.bind==true then
			changemoney(actor,ItemStd.index("��"..name),"-",take,log,true)
		elseif spec.bind==false then
			changemoney(actor,index,"-",take,log,true)
		elseif spec.bind==nil then
			consumebindmoney(actor,name,take,log)
		end
	elseif ItemStd.is_title(index) then
		deprivetitle(actor,name)
	else
		takeitem(actor,name,take,0,log)
	end
end
---@param actor string
---@param items ItemSpec[]
---@param factor? number  # ��Ʒ����
---@return boolean success
---@return string
function check_items(actor,items,factor)
	factor=factor or 1
	for _,spec in ipairs(items) do
		local bind=spec.bind or nil
		local success,itemname,need,has=check_item(actor,spec,factor)
		if not success then
			return false,("%s%s ����, ��Ҫ %d ��, ֻ�� %d ��"):format(bind and "�� " or "",itemname,need,has)
		end
	end
	return true,""
end
function give_items(actor,items,factor,log)
	factor=factor or 1
	for _,spec in ipairs(items) do
		give_item(actor,spec,factor,log)
	end
end
function take_items(actor,items,factor,log)
	factor=factor or 1
	for _,spec in ipairs(items) do
		take_item(actor,spec,factor,log)
	end
	return true
end
---@param obj string
---@param nID
---| -1 #�Ƿ���� (true:���)
---| 0 #�Ƿ����� (true:����״̬)
---| 1 #�������� (����ֵ�ַ���)��������Ϊ����ʱ��param3=0/nil�����ع�����ʾ��(��ȥ����β��������)��param3=1ʱ���ع���Ĭ����(����������õ�����)��param3=2ʱ���ع���ʵ����(��Ϸ��ʵ��չʾ������,����������64_23.08.30)
---| 2 #����ΨһID ?(����ֵ�ַ���) = userid
---| 3 #����ǰ��ͼID (����ֵ�ַ���)
---| 4 #����ǰX����
---| 5 #����ǰY����
---| 6 #����ǰ�ȼ�
---| 7 #����ǰְҵ (0-ս 1-�� 2-��)
---| 8 #����ǰ�Ա�
---| 9 #����ǰѪ��(HP)
---| 10 #����ǰѪ������(MAXHP)
---| 11 #����ǰ����(MP)
---| 12 #����ǰ��������(MAXMP)
---| 13 #����ǰ����(Exp)
---| 14 #����ǰ��������(MaxExp)
---| 15 #�����������
---| 16 #�����������
---| 17 #����ħ������
---| 18 #����ħ������
---| 19 #�����﹥����
---| 20 #�����﹥����
---| 21 #����ħ������
---| 22 #����ħ������
---| 23 #�����������
---| 24 #�����������
---| 25 #��������ֵ
---| 26 #����HP�ָ�
---| 27 #����MP�ָ�
---| 28 #�����ж��ָ�
---| 29 #������
---| 30 #����ħ�����
---| 31 #����׼ȷ(�޷�����)
---| 32 #��������
---| 33 #����
---| 34 #������Ʒ����(������)
---| 35 #�����Ա����(������)
---| 36 #�л���(������)
---| 37 #�Ƿ�᳤(������)
---| 38 #��������
---| 39 #ת���ȼ�(������)
---| 40 #ɱ�־��鱶��(������)
---| 41 #ɱ�־���ʱ��(������)
---| 42 #��ʾ��ʱTIMERECALL��ʣ������(������)
---| 43 #����ɱ�ֱ��ʱ���(������)
---| 44 #����ʱ��
---| 45 #��ͼ��MAPTITLE
---| 46 #PK��
---| 47 #�Ƿ�����(������)
---| 48 #�Ƿ�ȫ��
---| 49 #�Ƿ��̯��(������)
---| 50 #�Ƿ�����(������)
---| 51 #����att����ֵ����Ҫ�ṩ ����3:����ID(cfg_att_score.xls���ã�1~129��200~249)�Զ���������24.0807������չ��200~399
---| 52 #����/�ַ�ʽ 0=�ָ�/1=����/2=����/3=���˴���
---| 53 #��¼״̬��0��������1����������(������)
---| 54 #����UserId
---| 55 #Idx
---| 56 #��ɫ(0~255)
---| 57 #���ɱ���Ĺ���Index(������)
---| 57 #���ִ���(��֮ͬǰ MonItems ����)
---| 58 #ʱװ��ʾ״̬(������)
---| 59 #���˶���
---| 60 #�Ƿ��ڹ�ɳ/��������(bool)
---| 61 #�Ƿ�Ϊ���߹һ�״̬(bool)
---| 62 #��ȡ������Զ��峣��(25��)
---| 63 #���ﱳ����С
---| 64 #��ȡ����ǰ��������ɫֵ
---| 65 #��ȡ����Ļسǵ�ͼ
---| 67 #��ȡ����Ĺ�������
---| 68 #�����������
---| 69 #��ȡ����ǰ�ķ���(����������64_23.08.30)
BaseInfo={
	isplayer=function(actor,...) return getbaseinfo(actor,0,...) end, ---@return boolean  �Ƿ���� (true:���)
	isdead=function(actor,...) return getbaseinfo(actor,1,...) end, ---@return string   �Ƿ����� (true:����״̬)
	name=function(actor,...) return getbaseinfo(actor,1,...) end, ---@return string  �������� (����ֵ�ַ���)��������Ϊ����ʱ��param3=0/nil�����ع�����ʾ��(��ȥ����β��������)��param3=1ʱ���ع���Ĭ����(����������õ�����)��param3=2ʱ���ع���ʵ����(��Ϸ��ʵ��չʾ������,����������64_23.08.30)
	uniqueid=function(actor,...) return getbaseinfo(actor,2,...) end, ---@return string  ����ΨһID ?(����ֵ�ַ���) = userid
	mapid=function(actor,...) return getbaseinfo(actor,3,...) end, ---@return string  ����ǰ��ͼID (����ֵ�ַ���)
	x=function(actor,...) return getbaseinfo(actor,4,...) end, ---@return number   ����ǰX����
	y=function(actor,...) return getbaseinfo(actor,5,...) end, ---@return number   ����ǰY����
	level=function(actor,...) return getbaseinfo(actor,6,...) end, ---@return number   ����ǰ�ȼ�
	job=function(actor,...) return getbaseinfo(actor,7,...) end, ---@return number   ����ǰְҵ (0-ս 1-�� 2-��)
	gender=function(actor,...) return getbaseinfo(actor,8,...) end, ---@return number   ����ǰ�Ա�
	hp=function(actor,...) return getbaseinfo(actor,9,...) end, ---@return number   ����ǰѪ��(HP)
	maxhp=function(actor,...) return getbaseinfo(actor,10,...) end, ---@return number   ����ǰѪ������(MAXHP)
	mp=function(actor,...) return getbaseinfo(actor,11,...) end, ---@return number   ����ǰ����(MP)
	maxmp=function(actor,...) return getbaseinfo(actor,12,...) end, ---@return number   ����ǰ��������(MAXMP)
	exp=function(actor,...) return getbaseinfo(actor,13,...) end, ---@return number   ����ǰ����(Exp)
	maxexp=function(actor,...) return getbaseinfo(actor,14,...) end, ---@return number   ����ǰ��������(MaxExp)
	def=function(actor,...) return getbaseinfo(actor,15,...) end, ---@return number   �����������
	def_max=function(actor,...) return getbaseinfo(actor,16,...) end, ---@return number   �����������
	magic_def=function(actor,...) return getbaseinfo(actor,17,...) end, ---@return number   ����ħ������
	magic_def_max=function(actor,...) return getbaseinfo(actor,18,...) end, ---@return number   ����ħ������
	attack=function(actor,...) return getbaseinfo(actor,19,...) end, ---@return number   �����﹥����
	attack_max=function(actor,...) return getbaseinfo(actor,20,...) end, ---@return number   �����﹥����
	magic=function(actor,...) return getbaseinfo(actor,21,...) end, ---@return number   ����ħ������
	magic_max=function(actor,...) return getbaseinfo(actor,22,...) end, ---@return number   ����ħ������
	sprit=function(actor,...) return getbaseinfo(actor,23,...) end, ---@return number   �����������
	sprit_max=function(actor,...) return getbaseinfo(actor,24,...) end, ---@return number   �����������
	luck=function(actor,...) return getbaseinfo(actor,25,...) end, ---@return number   ��������ֵ
	hp_regen=function(actor,...) return getbaseinfo(actor,26,...) end, ---@return number   ����HP�ָ�
	mp_regen=function(actor,...) return getbaseinfo(actor,27,...) end, ---@return number   ����MP�ָ�
	poison_regen=function(actor,...) return getbaseinfo(actor,28,...) end, ---@return number   �����ж��ָ�
	poison_avoid=function(actor,...) return getbaseinfo(actor,29,...) end, ---@return number   ������
	magic_avoid=function(actor,...) return getbaseinfo(actor,30,...) end, ---@return number   ����ħ�����
	accuracy=function(actor,...) return getbaseinfo(actor,31,...) end, ---@return number   ����׼ȷ(�޷�����)
	speed=function(actor,...) return getbaseinfo(actor,32,...) end, ---@return number   ��������
	hairstyle=function(actor,...) return getbaseinfo(actor,33,...) end, ---@return number   ����
	bagcount=function(actor,...) return getbaseinfo(actor,34,...) end, ---@return number   ������Ʒ����(������)
	teamcount=function(actor,...) return getbaseinfo(actor,35,...) end, ---@return number   �����Ա����(������)
	guildname=function(actor,...) return getbaseinfo(actor,36,...) end, ---@return string   �л���(������)
	isleader=function(actor,...) return getbaseinfo(actor,37,...) end, ---@return boolean  �Ƿ�᳤(������)
	petcount=function(actor,...) return getbaseinfo(actor,38,...) end, ---@return number   ��������
	translevel=function(actor,...) return getbaseinfo(actor,39,...) end, ---@return number   ת���ȼ�(������)
	exp_rate=function(actor,...) return getbaseinfo(actor,40,...) end, ---@return number   ɱ�־��鱶��(������)
	exp_time=function(actor,...) return getbaseinfo(actor,41,...) end, ---@return number   ɱ�־���ʱ��(������)
	timerecall=function(actor,...) return getbaseinfo(actor,42,...) end, ---@return number   ��ʾ��ʱTIMERECALL��ʣ������(������)
	kill_rate=function(actor,...) return getbaseinfo(actor,43,...) end, ---@return number   ����ɱ�ֱ��ʱ���(������)
	revive_time=function(actor,...) return getbaseinfo(actor,44,...) end, ---@return number   ����ʱ��
	maptitle=function(actor,...) return getbaseinfo(actor,45,...) end, ---@return string   ��ͼ��MAPTITLE
	pkpoint=function(actor,...) return getbaseinfo(actor,46,...) end, ---@return number   PK��
	isnew=function(actor,...) return getbaseinfo(actor,47,...) end, ---@return boolean  �Ƿ�����(������)
	issafezone=function(actor,...) return getbaseinfo(actor,48,...) end, ---@return boolean  �Ƿ�ȫ��
	issell=function(actor,...) return getbaseinfo(actor,49,...) end, ---@return boolean  �Ƿ��̯��(������)
	istrade=function(actor,...) return getbaseinfo(actor,50,...) end, ---@return boolean  �Ƿ�����(������)
	att=function(actor,...) return getbaseinfo(actor,51,...) end, ---@return number   ����att����ֵ����Ҫ�ṩ ����3:����ID(cfg_att_score.xls���ã�1~129��200~249)�Զ���������24.0807������չ��200~399
	wear=function(actor,...) return getbaseinfo(actor,52,...) end, ---@return number   ����/�ַ�ʽ 0=�ָ�/1=����/2=����/3=���˴���
	loginstatus=function(actor,...) return getbaseinfo(actor,53,...) end, ---@return number   ��¼״̬��0��������1����������(������)
	masterid=function(actor,...) return getbaseinfo(actor,54,...) end, ---@return string   ����UserId
	idx=function(actor,...) return getbaseinfo(actor,55,...) end, ---@return number   Idx
	color=function(actor,...) return getbaseinfo(actor,56,...) end, ---@return number   ��ɫ(0~255)
	lastkill=function(actor,...) return getbaseinfo(actor,57,...) end, ---@return nil      ���ɱ���Ĺ���Index(������)
	clothes=function(actor,...) return getbaseinfo(actor,58,...) end, ---@return number   ʱװ��ʾ״̬(������)
	master=function(actor,...) return getbaseinfo(actor,59,...) end, ---@return string   ���˶���
	attack_area=function(actor,...) return getbaseinfo(actor,60,...) end, ---@return boolean  �Ƿ��ڹ�ɳ/��������(bool)
	isoffline=function(actor,...) return getbaseinfo(actor,61,...) end, ---@return boolean  �Ƿ�Ϊ���߹һ�״̬(bool)
	custom_const=function(actor,...) return getbaseinfo(actor,62,...) end, ---@return string   ��ȡ������Զ��峣��(25��)
	bagsize=function(actor,...) return getbaseinfo(actor,63,...) end, ---@return number   ���ﱳ����С
	body_color=function(actor,...) return getbaseinfo(actor,64,...) end, ---@return number   ��ȡ����ǰ��������ɫֵ
	back_map=function(actor,...) return getbaseinfo(actor,65,...) end, ---@return string   ��ȡ����Ļسǵ�ͼ
	hate=function(actor,...) return getbaseinfo(actor,67,...) end, ---@return string   ��ȡ����ǰ�Ĺ�������
	belons=function(actor,...) return getbaseinfo(actor,68,...) end, ---@return string   �����������
	direction=function(actor,...) return getbaseinfo(actor,69,...) end, ---@return number   ��ȡ����ǰ�ķ���(����������64_23.08.30)
}