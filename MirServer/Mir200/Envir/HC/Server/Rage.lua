local Rage={}
---@class Rage.cfg
local cfg={
	{
		cost={{id="Ԫ��",count=1000}},
		give={{id="���Ĵ���",count=1}},
	},
	{
		cost={{id="����",count=1}},
		give={{id="��ɨǧ��",count=1}},
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
		Common.tips("��������ˣ��޷��ٴμ��",actor,ColorTab.tips)
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
		Common.tips(("��ϲ��������%s��"):format(ItemStd.name(info.give[1].id)),actor,ColorTab.success)
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
Server.Rage=Rage
return Rage