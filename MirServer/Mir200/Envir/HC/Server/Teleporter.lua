local Teleporter = {}
---@class TeleporterCfg
Teleporter.cfg = {
	{ id = "0", title = "比奇村", x = 297, y = 626 },
	{ id = "2", title = "毒蛇山谷", x = 503, y = 481 },
	{ id = "3", title = "盟重省", x = 333, y = 333 },
	{ id = "4", title = "封魔谷", x = 241, y = 200 },
	{ id = "5", title = "苍月岛", x = 141, y = 335 },
	{ id = "6", title = "魔龙城", x = 141, y = 335 },
}
local validnpc = get_all_script_npc({ "主城传送员" })

function Teleporter._teleport(actor, id)
	local info = Teleporter.cfg[id]
	mapmove(actor, info.id, info.x, info.y)
end

Teleporter.teleport = check_npc_warp(Teleporter._teleport, validnpc)

function Teleporter._sync(actor)
	Clients[actor].Teleporter.cfg = unknown(HC.encode(Teleporter.cfg))
end

Event.add(Reg.sync, {
	fn = function(actor)
		Teleporter._sync(actor)
	end
})

Server.Teleporter = Teleporter
return Teleporter
