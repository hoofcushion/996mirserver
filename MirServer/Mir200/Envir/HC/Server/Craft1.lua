local Craft1 = {}

---@class Craft1.cfg
local cfg = {
	{
		{
			cost = { { id = "金条", count = 2 }, { id = "屠龙", count = 2 } },
			give = { { id = "黄金屠龙", count = 1 } },
		},
		{
			cost = { { id = "金条", count = 2 }, { id = "嗜魂法杖", count = 2 } },
			give = { { id = "紫金嗜魂法杖", count = 1 } },
		},
		{
			cost = { { id = "金条", count = 2 }, { id = "逍遥扇", count = 2 } },
			give = { { id = "赤金逍遥扇", count = 1 } },
		},
	},
	{
		{
			cost = { { id = "强化雷霆战戒", count = 1 }, { id = "金币", count = 880000 }, { id = "书页", count = 10 } },
			give = { { id = "开天斩", count = 1 } },
		},
		{
			cost = { { id = "强化烈焰魔戒", count = 1 }, { id = "金币", count = 880000 }, { id = "书页", count = 10 } },
			give = { { id = "灭天火", count = 1 } },
		},
		{
			cost = { { id = "强化光芒道戒", count = 1 }, { id = "金币", count = 880000 }, { id = "书页", count = 10 } },
			give = { { id = "噬血术", count = 1 } },
		},
	}
}

HC.walk(cfg, function(t, k, v)
	if k == "id" then
		t[k] = ItemStd.index(v) or error("Invalid item: " .. v)
	end
end)

function Craft1.craft(actor, page, index)
	local info = cfg[page]
	local spec = info[index]
	local ok, msg = check_items(actor, spec.cost)
	if not ok then
		Common.tips(msg, actor)
		return
	end
	if not take_items(actor, spec.cost) then
		Common.tips("扣除失败！", actor)
		return
	end
	give_items(actor, spec.give)
	Common.tips("锻造成功！", actor)
end

function Craft1._sync(actor)
	Clients[actor].Craft1.cfg = cfg
end

Event.add(Reg.sync, {
	fn = function(actor)
		Craft1._sync(actor)
	end
})

Server.Craft1 = Craft1
return Craft1
