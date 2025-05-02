Common={}
Common.is_server=not not sendluamsg
Common.is_client=not not (type(SL)=="table" and type(GUI)=="table")
---@param str string # 提示字符串
---@param actor? string # 服务端需要传入 actor
---@param color? string | integer # 颜色
function Common.tips(str,actor,color)
	assert_type("actor",actor,{"string","number"},true,2)
	if type(color)=="number" then
		color=Common.get_color(color)
	elseif not color then
		color="#FFFFFF"
	end
	local msg=("<font color='%s'>%s</font>"):format(color,str)
	if Common.is_client then
		SL:ShowSystemTips(msg)
	elseif Common.is_server then
		sendmsg(actor,1,tbl2json({Msg=msg,Type=9}))
	end
end
function Common.log(msg,actor)
	if Common.is_server then
		print(("Player: %s, ID: %s, %s"):format(getbaseinfo(actor,1),getbaseinfo(actor,2),msg))
	elseif Common.is_client then
		print(("Player: %s, ID: %s, %s"):format(Meta["USER_NAME"],Meta["USER_ID"],msg))
	end
end
function Common.sendmsg(id,int1,int2,int3,str,actor)
	if Common.is_client then
		SL:SendLuaNetMsg(id,int1,int2,int3,str)
	elseif Common.is_server then
		sendluamsg(actor,id,int1,int2,int3,str)
	end
end
Json={}
function Json.encode(x)
	if Common.is_client then
		return SL:JsonEncode(x)
	else
		return tbl2json(x)
	end
end
function Json.decode(x)
	if Common.is_client then
		return SL:JsonDecode(x)
	else
		return json2tbl(x)
	end
end
---@param jobs fun(callback:function)[] # 接收回调的任务列表
function Job(jobs)
	local i=0
	local function job()
		i=i+1
		local v=jobs[i]
		if v then
			v(job)
		end
	end
	job()
end
--- 返回索引本身的表
Reg=setmetatable({},{__index=function(_,k) return k end})
--- 返回索引哈希值的表
---@type table<string, integer>
Msg=setmetatable({},{
	__index=function(_,k)
		return HC.hash(k)
	end,
})
---@class RuleTbl
RuleTbl={ ---@enum (key) ItemRules
	no_drop=1,            -- 禁止丢弃
	no_trade=2,           -- 禁止交易
	no_storage=4,         -- 禁止存仓库
	no_repair=8,          -- 禁止修理
	no_sell=16,           -- 禁止出售
	no_spill=32,          -- 禁止爆出
	drop_disappear=64,    -- 丢弃消失
	dead_spill=128,       -- 死亡必爆
	no_auction=256,       -- 禁止拍卖
	no_challenge=512,     -- 禁止挑战
	spill_disappear=1024, -- 爆出消失
}
for k,v in pairs(RuleTbl) do
	RuleTbl[v]=k
end
--- 物品规则模块
ItemRule={}
---@param rule integer # 规则值
---@return RuleTbl
function ItemRule.parse(rule)
	local ret={}
	for i,v in HC.forbit(rule) do
		local k=RuleTbl[2^(i-1)]
		if v==1 then
			ret[k]=true
		end
	end
	return ret
end
---@param ruletbl table<ItemRules, boolean> # 规则表
---@return integer # 序列化后的规则值
function ItemRule.serialize(ruletbl)
	local ret=0
	for k,v in pairs(ruletbl) do
		if v then
			ret=ret+RuleTbl[k]
		end
	end
	return ret
end
---@class ItemSpec
local itemspec={
	id=nil, ---@type integer|string
	count=1, ---@type integer?
	rule=nil, ---@type RuleTbl?
	bind=nil, ---@type boolean?
	makeindex=nil, ---@type boolean?
	log=nil, ---@type string?
}
local bodyitem
if Common.is_client then
	function bodyitem(_,index)
		local info=MetaGet.EQUIP_DATA(index)
		return tonumber(info and info.MakeIndex)
	end
else
	bodyitem=function(actor,index)
		local itemobj=linkbodyitem(actor,index)
		local makeindex=getiteminfo(actor,itemobj,1)
		return tonumber(makeindex)
	end
end
--- 返回 makeindex
PlayerEquip={
	-- 基础装备
	armor=function(actor) return bodyitem(actor,0) end, ---@return integer # 护甲
	weapon=function(actor) return bodyitem(actor,1) end, ---@return integer # 武器
	medal=function(actor) return bodyitem(actor,2) end, ---@return integer # 勋章
	necklace=function(actor) return bodyitem(actor,3) end, ---@return integer # 项链
	helmet=function(actor) return bodyitem(actor,4) end, ---@return integer # 头盔
	right_arm=function(actor) return bodyitem(actor,5) end, ---@return integer # 右手镯
	left_arm=function(actor) return bodyitem(actor,6) end, ---@return integer # 左手镯
	right_ring=function(actor) return bodyitem(actor,7) end, ---@return integer # 右戒指
	left_ring=function(actor) return bodyitem(actor,8) end, ---@return integer # 左戒指
	bujuk=function(actor) return bodyitem(actor,9) end, ---@return integer # 符、毒药
	belt=function(actor) return bodyitem(actor,10) end, ---@return integer # 腰带
	boots=function(actor) return bodyitem(actor,11) end, ---@return integer # 靴子
	charm=function(actor) return bodyitem(actor,12) end, ---@return integer # 宝石、血石
	hat=function(actor) return bodyitem(actor,13) end, ---@return integer # 斗笠
	drum=function(actor) return bodyitem(actor,14) end, ---@return integer # 军鼓
	horse=function(actor) return bodyitem(actor,15) end, ---@return integer # 马牌
	shield=function(actor) return bodyitem(actor,16) end, ---@return integer # 盾牌
	ftowel=function(actor) return bodyitem(actor,55) end, ---@return integer # 面巾

	-- 时装装备
	s_armor=function(actor) return bodyitem(actor,17) end, ---@return integer # 时装衣服
	s_weapon=function(actor) return bodyitem(actor,18) end, ---@return integer # 时装武器
	s_hat=function(actor) return bodyitem(actor,19) end, ---@return integer # 时装斗笠
	s_necklace=function(actor) return bodyitem(actor,20) end, ---@return integer # 时装项链
	s_helmet=function(actor) return bodyitem(actor,21) end, ---@return integer # 时装头盔
	s_left_arm=function(actor) return bodyitem(actor,22) end, ---@return integer # 时装左手镯
	s_right_arm=function(actor) return bodyitem(actor,23) end, ---@return integer # 时装右手镯
	s_left_ring=function(actor) return bodyitem(actor,24) end, ---@return integer # 时装左戒指
	s_right_ring=function(actor) return bodyitem(actor,25) end, ---@return integer # 时装右戒指
	s_medal=function(actor) return bodyitem(actor,26) end, ---@return integer # 时装勋章
	s_belt=function(actor) return bodyitem(actor,27) end, ---@return integer # 时装腰带
	s_boots=function(actor) return bodyitem(actor,28) end, ---@return integer # 时装靴子
	s_charm=function(actor) return bodyitem(actor,29) end, ---@return integer # 时装宝石
	s_horse=function(actor) return bodyitem(actor,42) end, ---@return integer # 时装马牌
	s_bujuk=function(actor) return bodyitem(actor,43) end, ---@return integer # 时装符印
	s_drum=function(actor) return bodyitem(actor,44) end, ---@return integer # 时装军鼓
	s_shield=function(actor) return bodyitem(actor,45) end, ---@return integer # 时装盾牌
	s_ftowel=function(actor) return bodyitem(actor,46) end, ---@return integer # 时装面巾

	-- 首饰盒
	jewelry1=function(actor) return bodyitem(actor,30) end, ---@return integer # 首饰盒位置1
	jewelry2=function(actor) return bodyitem(actor,31) end, ---@return integer # 首饰盒位置2
	jewelry3=function(actor) return bodyitem(actor,32) end, ---@return integer # 首饰盒位置3
	jewelry4=function(actor) return bodyitem(actor,33) end, ---@return integer # 首饰盒位置4
	jewelry5=function(actor) return bodyitem(actor,34) end, ---@return integer # 首饰盒位置5
	jewelry6=function(actor) return bodyitem(actor,35) end, ---@return integer # 首饰盒位置6
	jewelry7=function(actor) return bodyitem(actor,36) end, ---@return integer # 首饰盒位置7
	jewelry8=function(actor) return bodyitem(actor,37) end, ---@return integer # 首饰盒位置8
	jewelry9=function(actor) return bodyitem(actor,38) end, ---@return integer # 首饰盒位置9
	jewelry10=function(actor) return bodyitem(actor,39) end, ---@return integer # 首饰盒位置10
	jewelry11=function(actor) return bodyitem(actor,40) end, ---@return integer # 首饰盒位置11
	jewelry12=function(actor) return bodyitem(actor,41) end, ---@return integer # 首饰盒位置12
}
local stditeminfo
if Common.is_client then
	local std_items=SL:GetMetaValue("STD_ITEMS")
	for _,v in pairs(std_items) do
		std_items[v.Name]=v
	end
	local map={
		[0]="Index",
		[1]="Name",
		[2]="StdMode",
		[3]="Shape",
		[4]="Weight",
		[5]="AniCount",
		[6]="MaxDura",
		[7]="Overlap",
		[8]="Price",
		[9]="Need",
		[10]="NeedLevel",
		[11]="sDivParam1",
		[12]="sDivParam2",
		[13]="Color",
	}
	stditeminfo=function(id,idx)
		return std_items[id][map[idx]]
	end
else
	stditeminfo=function(id,idx)
		return getstditeminfo(id,idx)
	end
end
ItemStd={
	index=function(id) return stditeminfo(id,0) end, ---@return integer # 物品索引
	name=function(id) return stditeminfo(id,1) end, ---@return string # 物品名称
	stdmode=function(id) return stditeminfo(id,2) end, ---@return integer # 物品模式
	shape=function(id) return stditeminfo(id,3) end, ---@return integer # 物品功能
	weight=function(id) return stditeminfo(id,4) end, ---@return integer # 物品重量
	anicount=function(id) return stditeminfo(id,5) end, ---@return integer # 物品功能
	maxdura=function(id) return stditeminfo(id,6) end, ---@return integer # 物品最大耐久度
	overlap=function(id) return stditeminfo(id,7) end, ---@return integer # 物品最大叠加数量
	price=function(id) return stditeminfo(id,8) end, ---@return integer # 物品售价
	need=function(id) return stditeminfo(id,9) end, ---@return integer # 物品需求
	needlevel=function(id) return stditeminfo(id,10) end, ---@return integer # 物品需求等级
	custom1=function(id) return stditeminfo(id,11) end, ---@return unknown # 物品自定义数据1
	custom2=function(id) return stditeminfo(id,12) end, ---@return unknown # 物品自定义数据2
	color=function(id) return stditeminfo(id,13) end, ---@return integer # 物品颜色
	is_money=function(id) return ItemStd.index(id)<=100 and ItemStd.stdmode(id)==41 end,
	is_title=function(id) return ItemStd.stdmode(id)==70 end,
}
local iteminfo
if Common.is_client then
	local map={
		[1]="MakeIndex",
		[2]="Index",
		[3]="Dura",
		[4]="DuraMax",
		[5]="Overlap",
		[6]="Bind",
		[7]=function(t)
			return t["originName"] or t["Name"]
		end,
		[8]="Name",
	}
	iteminfo=function(_,makeindex,idx)
		local itemdata=MetaGet.ITEM_DATA(makeindex)
		if itemdata then
			idx=map[idx]
			if idx then
				return idx=="function" and idx(itemdata) or itemdata[idx]
			end
		end
	end
elseif Common.is_server then
	iteminfo=function(actor,makeindex,idx)
		return getiteminfo(actor,getitembymakeindex(actor,makeindex),idx)
	end
end
--- 通过 make index 查询物品信息
ItemInfo={
	makeindex=function(makeindex,actor) return iteminfo(actor,makeindex,1) end, ---@return integer # 物品唯一ID
	index=function(makeindex,actor) return iteminfo(actor,makeindex,2) end, ---@return integer # 物品ID
	dura=function(makeindex,actor) return iteminfo(actor,makeindex,3) end, ---@return integer # 物品耐久度
	duramax=function(makeindex,actor) return iteminfo(actor,makeindex,4) end, ---@return integer # 物品最大耐久度
	overlap=function(makeindex,actor) return iteminfo(actor,makeindex,5) end, ---@return integer # 物品最大叠加数量
	bind=function(makeindex,actor) return iteminfo(actor,makeindex,6) end, ---@return boolean # 物品绑定状态
	name=function(makeindex,actor) return iteminfo(actor,makeindex,7) end, ---@return string # 物品名称
	newname=function(makeindex,actor) return iteminfo(actor,makeindex,8) end, ---@return string # 物品改名后的名称
}
ColorTab={
	[0]="#000000",
	[1]="#800000",
	[2]="#008000",
	[3]="#808000",
	[4]="#000080",
	[5]="#800080",
	[6]="#008080",
	[7]="#c0c0c0",
	[8]="#558097",
	[9]="#9db9c8",
	[10]="#7b7373",
	[11]="#2d2929",
	[12]="#5a5252",
	[13]="#635a5a",
	[14]="#423939",
	[15]="#1d1818",
	[16]="#181010",
	[17]="#291818",
	[18]="#100808",
	[19]="#f27971",
	[20]="#e1675f",
	[21]="#ff5a5a",
	[22]="#ff3131",
	[23]="#d65a52",
	[24]="#941000",
	[25]="#942918",
	[26]="#390800",
	[27]="#731000",
	[28]="#b51800",
	[29]="#bd6352",
	[30]="#421810",
	[31]="#ffaa99",
	[32]="#5a1000",
	[33]="#733929",
	[34]="#a54a31",
	[35]="#947b73",
	[36]="#bd5231",
	[37]="#522110",
	[38]="#7b3118",
	[39]="#2d1810",
	[40]="#8c4a31",
	[41]="#942900",
	[42]="#bd3100",
	[43]="#c67352",
	[44]="#6b3118",
	[45]="#c66b42",
	[46]="#ce4a00",
	[47]="#a56339",
	[48]="#5a3118",
	[49]="#2a1000",
	[50]="#150800",
	[51]="#3a1800",
	[52]="#080000",
	[53]="#290000",
	[54]="#4a0000",
	[55]="#9d0000",
	[56]="#dc0000",
	[57]="#de0000",
	[58]="#fb0000",
	[59]="#9c7352",
	[60]="#946b4a",
	[61]="#734a29",
	[62]="#523118",
	[63]="#8c4a18",
	[64]="#884411",
	[65]="#4a2100",
	[66]="#211810",
	[67]="#d6945a",
	[68]="#c66b21",
	[69]="#ef6b00",
	[70]="#ff7700",
	[71]="#a59484",
	[72]="#423121",
	[73]="#181008",
	[74]="#291808",
	[75]="#211000",
	[76]="#392918",
	[77]="#8c6339",
	[78]="#422910",
	[79]="#6b4218",
	[80]="#7b4a18",
	[81]="#944a00",
	[82]="#8c847b",
	[83]="#6b635a",
	[84]="#4a4239",
	[85]="#292118",
	[86]="#463929",
	[87]="#b5a594",
	[88]="#7b6b5a",
	[89]="#ceb194",
	[90]="#a58c73",
	[91]="#8c735a",
	[92]="#b59473",
	[93]="#d6a573",
	[94]="#efa54a",
	[95]="#efc68c",
	[96]="#7b6342",
	[97]="#6b5639",
	[98]="#bd945a",
	[99]="#633900",
	[100]="#d6c6ad",
	[101]="#524229",
	[102]="#946318",
	[103]="#efd6ad",
	[104]="#a58c63",
	[105]="#635a4a",
	[106]="#bda57b",
	[107]="#5a4218",
	[108]="#bd8c31",
	[109]="#353129",
	[110]="#948463",
	[111]="#7b6b4a",
	[112]="#a58c5a",
	[113]="#5a4a29",
	[114]="#9c7b39",
	[115]="#423110",
	[116]="#efad21",
	[117]="#181000",
	[118]="#292100",
	[119]="#9c6b00",
	[120]="#94845a",
	[121]="#524218",
	[122]="#6b5a29",
	[123]="#7b6321",
	[124]="#9c7b21",
	[125]="#dea500",
	[126]="#5a5239",
	[127]="#312910",
	[128]="#cebd7b",
	[129]="#635a39",
	[130]="#94844a",
	[131]="#c6a529",
	[132]="#109c18",
	[133]="#428c4a",
	[134]="#318c42",
	[135]="#109429",
	[136]="#081810",
	[137]="#081818",
	[138]="#082910",
	[139]="#184229",
	[140]="#a5b5ad",
	[141]="#6b7373",
	[142]="#182929",
	[143]="#18424a",
	[144]="#31424a",
	[145]="#63c6de",
	[146]="#44ddff",
	[147]="#8cd6ef",
	[148]="#736b39",
	[149]="#f7de39",
	[150]="#f7ef8c",
	[151]="#f7e700",
	[152]="#6b6b5a",
	[153]="#5a8ca5",
	[154]="#39b5ef",
	[155]="#4a9cce",
	[156]="#3184b5",
	[157]="#31526b",
	[158]="#deded6",
	[159]="#bdbdb5",
	[160]="#8c8c84",
	[161]="#f7f7de",
	[162]="#000818",
	[163]="#081839",
	[164]="#081029",
	[165]="#081800",
	[166]="#082900",
	[167]="#0052a5",
	[168]="#007bde",
	[169]="#10294a",
	[170]="#10396b",
	[171]="#10528c",
	[172]="#215aa5",
	[173]="#10315a",
	[174]="#104284",
	[175]="#315284",
	[176]="#182131",
	[177]="#4a5a7b",
	[178]="#526ba5",
	[179]="#293963",
	[180]="#104ade",
	[181]="#292921",
	[182]="#4a4a39",
	[183]="#292918",
	[184]="#4a4a29",
	[185]="#7b7b42",
	[186]="#9c9c4a",
	[187]="#5a5a29",
	[188]="#424214",
	[189]="#393900",
	[190]="#595900",
	[191]="#ca352c",
	[192]="#6b7321",
	[193]="#293100",
	[194]="#313910",
	[195]="#313918",
	[196]="#424a00",
	[197]="#526318",
	[198]="#5a7329",
	[199]="#314a18",
	[200]="#182100",
	[201]="#183100",
	[202]="#183910",
	[203]="#63844a",
	[204]="#6bbd4a",
	[205]="#63b54a",
	[206]="#63bd4a",
	[207]="#5a9c4a",
	[208]="#4a8c39",
	[209]="#63c64a",
	[210]="#63d64a",
	[211]="#52844a",
	[212]="#317329",
	[213]="#63c65a",
	[214]="#52bd4a",
	[215]="#10ff00",
	[216]="#182918",
	[217]="#4a884a",
	[218]="#4ae74a",
	[219]="#005a00",
	[220]="#008800",
	[221]="#009400",
	[222]="#00de00",
	[223]="#00ee00",
	[224]="#00fb00",
	[225]="#4a5a94",
	[226]="#6373b5",
	[227]="#7b8cd6",
	[228]="#6b7bd6",
	[229]="#7788ff",
	[230]="#c6c6ce",
	[231]="#94949c",
	[232]="#9c94c6",
	[233]="#313139",
	[234]="#291884",
	[235]="#180084",
	[236]="#4a4252",
	[237]="#52427b",
	[238]="#635a73",
	[239]="#ceb5f7",
	[240]="#8c7b9c",
	[241]="#7722cc",
	[242]="#ddaaff",
	[243]="#f0b42a",
	[244]="#df009f",
	[245]="#e317b3",
	[246]="#fffbf0",
	[247]="#a0a0a4",
	[248]="#808080",
	[249]="#ff0000",
	[250]="#00ff00",
	[251]="#ffff00",
	[252]="#0000ff",
	[253]="#ff00ff",
	[254]="#00ffff",
	[255]="#ffffff",
}
ColorTab.failed="#FF0000"
ColorTab.success="#00FF00"
ColorTab.warning="#FFFF00"
ColorTab.tips="#00FFFF"
function Common.get_color(id)
	return ColorTab[id] or "#FFFFFF"
end
AttrTab={}
if Common.is_client then
	AttrTab=require("scripts/game_config/cfg_att_score",true)
else
	AttrTab=require("game_config/cfg_att_score",true)
end