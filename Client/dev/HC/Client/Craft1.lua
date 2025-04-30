--- Craft1
local M = {}
---@type Craft1.cfg
M.cfg = nil
M.page = 1

function M.main(npcid)
	M.window = Window(Reg.Craft1, npcid)
	M.tree = GUI:ui_delegate(M.window)

	GUI:LoadExport(M.window, "A/Craft1")
	GUI:Win_SetDrag(M.window, M.tree.Background)
	local w, h = SL:GetMetaValue("SCREEN_WIDTH"), SL:GetMetaValue("SCREEN_HEIGHT")
	GUI:setPosition(M.tree.Node, w / 2, h / 2)

	CloseButton(M.tree.Background)
	GUI:addOnClickEvent(M.tree.Button_Close, function()
		GUI:Win_Close(M.window)
	end)

	for i, button in GetAllByPrefix(M.tree.Node_Pages, "Button") do
		GUI:addOnClickEvent(button, function()
			M.page = i
			M.update()
		end)
	end
	for i, button in GetAllByPrefix(M.tree.Node_1, "Button") do
		GUI:addOnClickEvent(button, function()
			Server.Craft1.craft(M.page, i)
		end)
	end
	M.update()
end

function M.update()
	if GUI:Win_IsNull(M.window) then
		return
	end
	local cfg = M.cfg[M.page]
	if not cfg then
		Common.sendmsg(Msg.sync)
		return
	end
	for i, node in GetAllByPrefix(M.tree.Node_ItemShows, "Node") do
		local info = cfg[i]
		for j, itemshow in GetAllByPrefix(node, "Item") do
			local item = info.cost[j]
			GUI:setVisible(itemshow, item ~= nil)
			if item ~= nil then
				GUI:ItemShow_updateItem(itemshow, {
					index = item.id,
					count = item.count,
					look = true,
					bgVisible = true,
				})
			end
		end
		local out = GUI:getChildByName(node, "Item_Out")
		GUI:ItemShow_updateItem(out, {
			index = info.give[1].id,
			count = info.give[1].count,
			look = true,
			bgVisible = true,
		})
	end
end

Client.Craft1 = M
return M
