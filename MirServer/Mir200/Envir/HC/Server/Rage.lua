local Rage={}
---@class Rage.cfg
local cfg={
	{
		cost={{id="元宝",count=1000}},
		give={{id="龙的传人",count=1}},
	},
	{
		cost={{id="金条",count=1}},
		give={{id="横扫千军",count=1}},
	},
}
HC.walk(cfg,function(t,k,v)
	if k=="id" then
		t[k]=ItemStd.index(v) or error("Invalid item: "..v)
	end
end)
function Rage.activate(actor,i)
	local info=cfg[i]
	if check_items(actor,info.give) then
		Common.tips("您激活过了，无法再次激活！",actor,ColorTab.tips)
		take_items(actor,info.give)
		return
	end
	local ok,msg=check_items(actor,info.cost)
	if not ok then
		Common.tips(msg,actor,ColorTab.warning)
		return
	end
	if ok then
		take_items(actor,info.cost)
		give_items(actor,info.give)
		Common.tips(("恭喜您激活了%s！"):format(ItemStd.name(info.give[1].id)),actor,ColorTab.success)
	end
end
function Rage._sync(actor)
	Clients[actor].Rage.cfg=cfg
end
Event.add(Reg.sync,{
	fn=function(actor)
		Rage._sync(actor)
	end,
})
-- 有称号的人击杀另一个有称号的人，可以获得一半的激活费用，被击杀的人失去称号
Event.register(Reg.playdie,{
	fn=function(actor,hiter)
		for _,v in ipairs(cfg) do
			if check_items(actor,v.give) and check_items(hiter,v.give) then
				give_items(hiter,v.cost,0.5)
				take_items(actor,v.give)
				Common.tips(("您斩杀了激活了 %s 的 %s！"):format(ItemStd.name(v.give[1].id),ItemStd.name(v.give[1].id)),actor,
																ColorTab.success)
				return
			end
		end
	end,
})
function Rage._is_protected(actor)
	return BaseInfo.attack_area(actor)
end
Server.Rage=Rage
return Rage