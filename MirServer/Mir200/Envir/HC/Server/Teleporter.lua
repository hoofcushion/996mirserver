local Teleporter={}
---@class TeleporterCfg
Teleporter.cfg={
	{title="����ʡ",mapid="3",x=333,y=333},
	{title="�����",mapid="0",x=330,y=269},
	{title="������",mapid="11",x=177,y=326},
	{title="��ħ��",mapid="4",x=241,y=201},
	{title="���µ�",mapid="5",x=140,y=334},
	{title="ħ����",mapid="6",x=124,y=156},
	{title="�߽��",mapid="0",x=290,y=618},
}
local validnpc=get_all_script_npc({"���Ǵ���Ա"})
function Teleporter._teleport(actor,id)
	local info=Teleporter.cfg[id]
	mapmove(actor,info.mapid,info.x,info.y)
end
Teleporter.teleport=check_npc_warp(Teleporter._teleport,validnpc)
function Teleporter._sync(actor)
	Clients[actor].Teleporter.cfg=unknown(Teleporter.cfg)
end
Event.add(Reg.sync,{
	fn=function(actor)
		Teleporter._sync(actor)
	end,
})
Server.Teleporter=Teleporter
return Teleporter