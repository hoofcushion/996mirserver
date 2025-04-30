local LuckyNecklace = {}

function LuckyNecklace.main(npcid)
	LuckyNecklace.window = Window(Reg.LuckyNecklace, npcid)
	LuckyNecklace.tree = GUI:ui_delegate(LuckyNecklace.window)

	GUI:LoadExport(LuckyNecklace.window, "A/LuckyNecklace")
	GUI:Win_SetDrag(LuckyNecklace.window, LuckyNecklace.tree.Background)
	local w, h = SL:GetMetaValue("SCREEN_WIDTH"), SL:GetMetaValue("SCREEN_HEIGHT")
	GUI:setPosition(LuckyNecklace.tree.Node, w / 2, h / 2)

	CloseButton(LuckyNecklace.tree.Background)
	GUI:addOnClickEvent(LuckyNecklace.tree.Button_Close, function()
		GUI:Win_Close(LuckyNecklace.window)
	end)

	GUI:addOnClickEvent(LuckyNecklace.tree.Button_Upgrade, function()
		Server.LuckyNecklace.upgrade()
	end)

	GUI:addOnClickEvent(LuckyNecklace.tree.Button_Reset, function()
		Server.LuckyNecklace.reset()
	end)
	LuckyNecklace.update()
end

function LuckyNecklace.update()
	if GUI:Win_IsNull(LuckyNecklace.window) then
		return
	end
	local makeindex = PlayerEquip.necklace()
	local itemdata = SL:GetMetaValue("EQUIP_DATA_BY_MAKEINDEX", makeindex)
	local lucky = HC.get(itemdata.Values, function(x)
		if x.Id == 5 then
			return tonumber(x.Value)
		end
	end) or 0
	for i, star in GetAllByPrefix(LuckyNecklace.tree.Node_2, "Button") do
		GUI:Button_setBrightStyle(star, lucky >= i and 1 or 0)
	end
end

Client.LuckyNecklace = LuckyNecklace
return LuckyNecklace
