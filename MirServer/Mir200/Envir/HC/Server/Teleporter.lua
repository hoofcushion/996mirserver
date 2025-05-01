local Teleporter={}
---@class TeleporterCfg
Teleporter.cfg={
	{title="盟重省",mapid="3",x=333,y=333},
	{title="比奇城",mapid="0",x=330,y=269},
	{title="白日门",mapid="11",x=177,y=326},
	{title="封魔谷",mapid="4",x=241,y=201},
	{title="苍月岛",mapid="5",x=140,y=334},
	{title="魔龙城",mapid="6",x=124,y=156},
	{title="边界村",mapid="0",x=290,y=618},
}
local validnpc=get_all_script_npc({"主城传送员"})
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