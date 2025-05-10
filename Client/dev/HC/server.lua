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
	A=function(id) return ("A"..id) end, ---@return string 字符型系统变量 重启服务器保存500个 (A0 - A499) 存放在 Mir200/GlobalVal.ini 文件里面
	G=function(id) return ("G"..id) end, ---@return number 数字型系统变量 重启服务器保存500个 (G0 - G499) 存放在 Mir200/GlobalVal.ini 文件里面
	I=function(id) return ("I"..id) end, ---@return number 临时数字型系统变量 重启服务器不保存.100个 (I0 - I99)
	S=function(id) return ("S"..id) end, ---@return string 临时字符型个人变量	下线不保存.100个 (S0 - S99)
	D=function(id) return ("D"..id) end, ---@return number 临时数字型个人变量	下线不保存.100个 (D0 - D99)摇骰子变量
	N=function(id) return ("N"..id) end, ---@return number 临时数字型个人变量	下线不保存.100个 (N0 - N99)
	M=function(id) return ("M"..id) end, ---@return number 临时数字型个人变量	下线不保存.100个 (M0 - M99)切换地图清空
	U=function(id) return ("U"..id) end, ---@return number 数字型个人变量	可保存.255个 (U0 - U254)最大值21亿
	T=function(id) return ("T"..id) end, ---@return string 字符型个人变量	可保存.255个 (T0 - T254)最大长度8000字符串以内
	J=function(id) return ("J"..id) end, ---@return number 当天数字型个人变量	可保存.每晚自动12点重置,合区或关停服务器请错开00:00点.500个 (J0 - J499)
	Z=function(id) return ("Z"..id) end, ---@return string 当天字符型个人变量	可保存.每晚自动12点重置,合区或关停服务器请错开00:00点.500个 (Z0 - Z499)
	P=function(id) return ("P"..id) end, ---@return number NPC数字型个人变量	仅在当前NPC有效.当Close对话时.所有P变量归零.100个 (P0 - P99)
	B=function(id) return ("B"..id) end, ---@return number 大数数字型个人变量	可保存.最高支持19位数,适用大数值操作.100个 (B0 - B99)
	F=function(id) return (id) end, ---@return 0|1 比特位个人标记	可保存,该变量只有0和1的两种状态
}
---@class SysVar
SysVar={
	open_timing=VarType.G(0), -- 开服时间戳
	merge_count=VarType.G(1), -- 合区次数
}
---@class PlayDef
PlayDef={}
-- 个人标记 	整数型个人变量 	可保存,该变量只有0和1的两种状态
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
--- 曼哈顿距离
function get_distance(a,b)
	return math.abs(b[1]-a[1])+math.abs(b[2]-a[2])
end
--- 笛卡尔距离
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
			msg="距离 NPC 过远"
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
			return querymoney(actor,ItemStd.index("绑定"..name))
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
			changemoney(actor,ItemStd.index("绑定"..name),"+",give,log,true)
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
			changemoney(actor,ItemStd.index("绑定"..name),"-",take,log,true)
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
---@param factor? number  # 物品倍率
---@return boolean success
---@return string
function check_items(actor,items,factor)
	factor=factor or 1
	for _,spec in ipairs(items) do
		local bind=spec.bind or nil
		local success,itemname,need,has=check_item(actor,spec,factor)
		if not success then
			return false,("%s%s 不足, 需要 %d 个, 只有 %d 个"):format(bind and "绑定 " or "",itemname,need,has)
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
---| -1 #是否玩家 (true:玩家)
---| 0 #是否死亡 (true:死亡状态)
---| 1 #对象名称 (返回值字符型)，当对象为怪物时，param3=0/nil，返回怪物显示名(即去除了尾部的数字)，param3=1时返回怪物默认名(怪物表中配置的名字)，param3=2时返回怪物实际名(游戏内实际展示的名字,新增于引擎64_23.08.30)
---| 2 #对象唯一ID ?(返回值字符型) = userid
---| 3 #对象当前地图ID (返回值字符型)
---| 4 #对象当前X坐标
---| 5 #对象当前Y坐标
---| 6 #对象当前等级
---| 7 #对象当前职业 (0-战 1-法 2-道)
---| 8 #对象当前性别
---| 9 #对象当前血量(HP)
---| 10 #对象当前血量上限(MAXHP)
---| 11 #对象当前蓝量(MP)
---| 12 #对象当前蓝量上限(MAXMP)
---| 13 #对象当前经验(Exp)
---| 14 #对象当前经验上限(MaxExp)
---| 15 #对象物防下限
---| 16 #对象物防上限
---| 17 #对象魔防下限
---| 18 #对象魔防上限
---| 19 #对象物攻下限
---| 20 #对象物攻上限
---| 21 #对象魔攻下限
---| 22 #对象魔攻上限
---| 23 #对象道攻下限
---| 24 #对象道攻上限
---| 25 #对象幸运值
---| 26 #对象HP恢复
---| 27 #对象MP恢复
---| 28 #对象中毒恢复
---| 29 #毒物躲避
---| 30 #对象魔法躲避
---| 31 #对象准确(无法设置)
---| 32 #对象敏捷
---| 33 #发型
---| 34 #背包物品数量(仅人物)
---| 35 #队伍成员数量(仅人物)
---| 36 #行会名(仅人物)
---| 37 #是否会长(仅人物)
---| 38 #宠物数量
---| 39 #转生等级(仅人物)
---| 40 #杀怪经验倍数(仅人物)
---| 41 #杀怪经验时间(仅人物)
---| 42 #显示延时TIMERECALL还剩多少秒(仅人物)
---| 43 #人物杀怪爆率倍数(仅人物)
---| 44 #复活时间
---| 45 #地图名MAPTITLE
---| 46 #PK点
---| 47 #是否新人(仅人物)
---| 48 #是否安全区
---| 49 #是否摆摊中(仅人物)
---| 50 #是否交易中(仅人物)
---| 51 #对象att属性值，需要提供 参数3:属性ID(cfg_att_score.xls设置：1~129，200~249)自定义属性在24.0807引擎拓展到200~399
---| 52 #穿人/怪方式 0=恢复/1=穿人/2=穿怪/3=穿人穿怪
---| 53 #登录状态，0：正常，1：断线重连(仅人物)
---| 54 #主人UserId
---| 55 #Idx
---| 56 #颜色(0~255)
---| 57 #最后杀死的怪物Index(仅人物)
---| 57 #爆怪次数(等同之前 MonItems 功能)
---| 58 #时装显示状态(仅人物)
---| 59 #主人对象
---| 60 #是否在攻沙/攻城区域(bool)
---| 61 #是否为离线挂机状态(bool)
---| 62 #获取怪物表自定义常量(25列)
---| 63 #人物背包大小
---| 64 #获取对象当前的身体颜色值
---| 65 #获取对象的回城地图
---| 67 #获取对象的攻击对象
---| 68 #怪物归属对象
---| 69 #获取对象当前的方向(新增于引擎64_23.08.30)
BaseInfo={
	isplayer=function(actor,...) return getbaseinfo(actor,0,...) end, ---@return boolean  是否玩家 (true:玩家)
	isdead=function(actor,...) return getbaseinfo(actor,1,...) end, ---@return string   是否死亡 (true:死亡状态)
	name=function(actor,...) return getbaseinfo(actor,1,...) end, ---@return string  对象名称 (返回值字符型)，当对象为怪物时，param3=0/nil，返回怪物显示名(即去除了尾部的数字)，param3=1时返回怪物默认名(怪物表中配置的名字)，param3=2时返回怪物实际名(游戏内实际展示的名字,新增于引擎64_23.08.30)
	uniqueid=function(actor,...) return getbaseinfo(actor,2,...) end, ---@return string  对象唯一ID ?(返回值字符型) = userid
	mapid=function(actor,...) return getbaseinfo(actor,3,...) end, ---@return string  对象当前地图ID (返回值字符型)
	x=function(actor,...) return getbaseinfo(actor,4,...) end, ---@return number   对象当前X坐标
	y=function(actor,...) return getbaseinfo(actor,5,...) end, ---@return number   对象当前Y坐标
	level=function(actor,...) return getbaseinfo(actor,6,...) end, ---@return number   对象当前等级
	job=function(actor,...) return getbaseinfo(actor,7,...) end, ---@return number   对象当前职业 (0-战 1-法 2-道)
	gender=function(actor,...) return getbaseinfo(actor,8,...) end, ---@return number   对象当前性别
	hp=function(actor,...) return getbaseinfo(actor,9,...) end, ---@return number   对象当前血量(HP)
	maxhp=function(actor,...) return getbaseinfo(actor,10,...) end, ---@return number   对象当前血量上限(MAXHP)
	mp=function(actor,...) return getbaseinfo(actor,11,...) end, ---@return number   对象当前蓝量(MP)
	maxmp=function(actor,...) return getbaseinfo(actor,12,...) end, ---@return number   对象当前蓝量上限(MAXMP)
	exp=function(actor,...) return getbaseinfo(actor,13,...) end, ---@return number   对象当前经验(Exp)
	maxexp=function(actor,...) return getbaseinfo(actor,14,...) end, ---@return number   对象当前经验上限(MaxExp)
	def=function(actor,...) return getbaseinfo(actor,15,...) end, ---@return number   对象物防下限
	def_max=function(actor,...) return getbaseinfo(actor,16,...) end, ---@return number   对象物防上限
	magic_def=function(actor,...) return getbaseinfo(actor,17,...) end, ---@return number   对象魔防下限
	magic_def_max=function(actor,...) return getbaseinfo(actor,18,...) end, ---@return number   对象魔防上限
	attack=function(actor,...) return getbaseinfo(actor,19,...) end, ---@return number   对象物攻下限
	attack_max=function(actor,...) return getbaseinfo(actor,20,...) end, ---@return number   对象物攻上限
	magic=function(actor,...) return getbaseinfo(actor,21,...) end, ---@return number   对象魔攻下限
	magic_max=function(actor,...) return getbaseinfo(actor,22,...) end, ---@return number   对象魔攻上限
	sprit=function(actor,...) return getbaseinfo(actor,23,...) end, ---@return number   对象道攻下限
	sprit_max=function(actor,...) return getbaseinfo(actor,24,...) end, ---@return number   对象道攻上限
	luck=function(actor,...) return getbaseinfo(actor,25,...) end, ---@return number   对象幸运值
	hp_regen=function(actor,...) return getbaseinfo(actor,26,...) end, ---@return number   对象HP恢复
	mp_regen=function(actor,...) return getbaseinfo(actor,27,...) end, ---@return number   对象MP恢复
	poison_regen=function(actor,...) return getbaseinfo(actor,28,...) end, ---@return number   对象中毒恢复
	poison_avoid=function(actor,...) return getbaseinfo(actor,29,...) end, ---@return number   毒物躲避
	magic_avoid=function(actor,...) return getbaseinfo(actor,30,...) end, ---@return number   对象魔法躲避
	accuracy=function(actor,...) return getbaseinfo(actor,31,...) end, ---@return number   对象准确(无法设置)
	speed=function(actor,...) return getbaseinfo(actor,32,...) end, ---@return number   对象敏捷
	hairstyle=function(actor,...) return getbaseinfo(actor,33,...) end, ---@return number   发型
	bagcount=function(actor,...) return getbaseinfo(actor,34,...) end, ---@return number   背包物品数量(仅人物)
	teamcount=function(actor,...) return getbaseinfo(actor,35,...) end, ---@return number   队伍成员数量(仅人物)
	guildname=function(actor,...) return getbaseinfo(actor,36,...) end, ---@return string   行会名(仅人物)
	isleader=function(actor,...) return getbaseinfo(actor,37,...) end, ---@return boolean  是否会长(仅人物)
	petcount=function(actor,...) return getbaseinfo(actor,38,...) end, ---@return number   宠物数量
	translevel=function(actor,...) return getbaseinfo(actor,39,...) end, ---@return number   转生等级(仅人物)
	exp_rate=function(actor,...) return getbaseinfo(actor,40,...) end, ---@return number   杀怪经验倍数(仅人物)
	exp_time=function(actor,...) return getbaseinfo(actor,41,...) end, ---@return number   杀怪经验时间(仅人物)
	timerecall=function(actor,...) return getbaseinfo(actor,42,...) end, ---@return number   显示延时TIMERECALL还剩多少秒(仅人物)
	kill_rate=function(actor,...) return getbaseinfo(actor,43,...) end, ---@return number   人物杀怪爆率倍数(仅人物)
	revive_time=function(actor,...) return getbaseinfo(actor,44,...) end, ---@return number   复活时间
	maptitle=function(actor,...) return getbaseinfo(actor,45,...) end, ---@return string   地图名MAPTITLE
	pkpoint=function(actor,...) return getbaseinfo(actor,46,...) end, ---@return number   PK点
	isnew=function(actor,...) return getbaseinfo(actor,47,...) end, ---@return boolean  是否新人(仅人物)
	issafezone=function(actor,...) return getbaseinfo(actor,48,...) end, ---@return boolean  是否安全区
	issell=function(actor,...) return getbaseinfo(actor,49,...) end, ---@return boolean  是否摆摊中(仅人物)
	istrade=function(actor,...) return getbaseinfo(actor,50,...) end, ---@return boolean  是否交易中(仅人物)
	att=function(actor,...) return getbaseinfo(actor,51,...) end, ---@return number   对象att属性值，需要提供 参数3:属性ID(cfg_att_score.xls设置：1~129，200~249)自定义属性在24.0807引擎拓展到200~399
	wear=function(actor,...) return getbaseinfo(actor,52,...) end, ---@return number   穿人/怪方式 0=恢复/1=穿人/2=穿怪/3=穿人穿怪
	loginstatus=function(actor,...) return getbaseinfo(actor,53,...) end, ---@return number   登录状态，0：正常，1：断线重连(仅人物)
	masterid=function(actor,...) return getbaseinfo(actor,54,...) end, ---@return string   主人UserId
	idx=function(actor,...) return getbaseinfo(actor,55,...) end, ---@return number   Idx
	color=function(actor,...) return getbaseinfo(actor,56,...) end, ---@return number   颜色(0~255)
	lastkill=function(actor,...) return getbaseinfo(actor,57,...) end, ---@return nil      最后杀死的怪物Index(仅人物)
	clothes=function(actor,...) return getbaseinfo(actor,58,...) end, ---@return number   时装显示状态(仅人物)
	master=function(actor,...) return getbaseinfo(actor,59,...) end, ---@return string   主人对象
	attack_area=function(actor,...) return getbaseinfo(actor,60,...) end, ---@return boolean  是否在攻沙/攻城区域(bool)
	isoffline=function(actor,...) return getbaseinfo(actor,61,...) end, ---@return boolean  是否为离线挂机状态(bool)
	custom_const=function(actor,...) return getbaseinfo(actor,62,...) end, ---@return string   获取怪物表自定义常量(25列)
	bagsize=function(actor,...) return getbaseinfo(actor,63,...) end, ---@return number   人物背包大小
	body_color=function(actor,...) return getbaseinfo(actor,64,...) end, ---@return number   获取对象当前的身体颜色值
	back_map=function(actor,...) return getbaseinfo(actor,65,...) end, ---@return string   获取对象的回城地图
	hate=function(actor,...) return getbaseinfo(actor,67,...) end, ---@return string   获取对象当前的攻击对象
	belons=function(actor,...) return getbaseinfo(actor,68,...) end, ---@return string   怪物归属对象
	direction=function(actor,...) return getbaseinfo(actor,69,...) end, ---@return number   获取对象当前的方向(新增于引擎64_23.08.30)
}