local LuckNecklace={}
local cfg={
	[1]={rate=70,cost={{id="Ԫ��",count=300}}},
	[2]={rate=50,cost={{id="Ԫ��",count=500}}},
	[3]={rate=20,cost={{id="Ԫ��",count=1000}}},
}
HC.walk(cfg,function(t,k,v)
	if k=="id" then
		t[k]=ItemStd.index(v) or error("Invalid item: "..v)
	end
end)
local crit_p=Rng.create({
	[80]={1,2,3},
	[15]={4},
	[5]={5},
})
local validnpc=get_all_script_npc({"���Ǵ���Ա"})
function LuckNecklace._upgrade(actor)
	local makeindex=PlayerEquip.necklace(actor)
	if makeindex==0 then
		Common.tips("�����������������",actor,ColorTab.warning)
		return
	end
	local itemobj=getitembymakeindex(actor,makeindex)
	local lucky=getitemaddvalue(actor,itemobj,1,5,0)
	lucky=math.max(lucky,0)
	if lucky>=3 then
		Common.tips("��������������������",actor,ColorTab.tips)
		return
	end
	local spec=cfg[lucky+1]
	if not spec then
		Common.tips("δ֪����",actor,lucky,ColorTab.warning)
		return
	end
	local ok,msg=check_items(actor,spec.cost)
	if not ok then
		Common.tips(msg,actor,ColorTab.warning)
		return
	end
	take_items(actor,spec.cost)
	local ram=math.random(1,100)
	if ram>spec.rate then
		Common.tips("ǿ��ʧ�ܣ�",actor,ColorTab.failed)
		return
	end
	setitemaddvalue(actor,itemobj,1,5,lucky+1)
	if lucky+1>=3 then
		local crit=Rng.get(crit_p)
		setnewitemvalue(actor,3,0,"=",crit,itemobj)
		Common.tips("ǿ���ɹ��������� + "..tostring(crit).."%",actor,ColorTab.success)
	else
		Common.tips("ǿ���ɹ���",actor,ColorTab.success)
	end
	refreshitem(actor,itemobj)
	Clients[actor].LuckyNecklace.update()
end
LuckNecklace.upgrade=check_npc_warp(LuckNecklace._upgrade,validnpc)
function LuckNecklace._reset(actor)
	local makeindex=PlayerEquip.necklace(actor)
	if makeindex==0 then
		Common.tips("�����������������",actor,ColorTab.warning)
		return
	end
	local itemobj=getitembymakeindex(actor,makeindex)
	local lucky=getitemaddvalue(actor,itemobj,1,5,0)
	lucky=math.max(lucky,0)
	if lucky<3 then
		Common.tips("�����������˻�δ������",actor,ColorTab.warning)
		return
	end
	setitemaddvalue(actor,itemobj,1,5,  2)
	setnewitemvalue(actor,3,      0,"=",0,itemobj)
	Common.tips("���óɹ���",actor,  ColorTab.success)
	refreshitem(actor,  itemobj)
	Clients[actor].LuckyNecklace.update()
end
LuckNecklace.reset=check_npc_warp(LuckNecklace._reset,validnpc)
Server.LuckyNecklace=LuckNecklace
return LuckNecklace