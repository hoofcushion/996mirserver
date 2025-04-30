local ui = {}

function ui.init(parent)
	-- Create Node
	local Node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
	GUI:setTag(Node, -1)

	-- Create Background
	local Background = GUI:Image_Create(Node, "Background", 0.00, 0.00, "res/public/bg_npc_08.jpg")
	GUI:setAnchorPoint(Background, 0.50, 0.50)
	GUI:setTouchEnabled(Background, false)
	GUI:setTag(Background, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Node, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, -1)

	-- Create Button_Upgrade
	local Button_Upgrade = GUI:Button_Create(Node_1, "Button_Upgrade", -70.00, -75.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_Upgrade, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_Upgrade, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_Upgrade, "升级")
	GUI:Button_setTitleColor(Button_Upgrade, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Upgrade, 14)
	GUI:Button_titleEnableOutline(Button_Upgrade, "#000000", 1)
	GUI:Win_SetParam(Button_Upgrade, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_Upgrade, 0.50, 0.50)
	GUI:setTouchEnabled(Button_Upgrade, true)
	GUI:setTag(Button_Upgrade, -1)

	-- Create Button_Reset
	local Button_Reset = GUI:Button_Create(Node_1, "Button_Reset", 70.00, -75.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_Reset, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_Reset, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_Reset, "重置")
	GUI:Button_setTitleColor(Button_Reset, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Reset, 14)
	GUI:Button_titleEnableOutline(Button_Reset, "#000000", 1)
	GUI:Win_SetParam(Button_Reset, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_Reset, 0.50, 0.50)
	GUI:setTouchEnabled(Button_Reset, true)
	GUI:setTag(Button_Reset, -1)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(Node, "Node_2", 0.00, 0.00)
	GUI:setTag(Node_2, -1)

	-- Create EquipShow
	local EquipShow = GUI:EquipShow_Create(Node_2, "EquipShow", 0.00, 41.00, 3, false, {bgVisible = true, look = true, starLv = false})
	GUI:setAnchorPoint(EquipShow, 0.50, 0.50)
	GUI:setTag(EquipShow, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_2, "Button_1", -50.00, 0.00, "res/public/1900000656.png")
	GUI:Button_loadTexturePressed(Button_1, "res/public/1900000657.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/public/1900000656.png")
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:Button_setBright(Button_1, false)
	GUI:Win_SetParam(Button_1, {grey = 0}, "Button")
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, false)
	GUI:setTag(Button_1, -1)
	GUI:setSwallowTouches(Button_1, false)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_2, "Button_2", 0.00, 0.00, "res/public/1900000656.png")
	GUI:Button_loadTexturePressed(Button_2, "res/public/1900000657.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/public/1900000656.png")
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:Button_setBright(Button_2, false)
	GUI:Win_SetParam(Button_2, {grey = 0}, "Button")
	GUI:setAnchorPoint(Button_2, 0.50, 0.50)
	GUI:setTouchEnabled(Button_2, false)
	GUI:setTag(Button_2, -1)
	GUI:setSwallowTouches(Button_2, false)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_2, "Button_3", 50.00, 0.00, "res/public/1900000656.png")
	GUI:Button_loadTexturePressed(Button_3, "res/public/1900000657.png")
	GUI:Button_loadTextureDisabled(Button_3, "res/public/1900000656.png")
	GUI:Button_setTitleText(Button_3, "")
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 14)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:Button_setBright(Button_3, false)
	GUI:Win_SetParam(Button_3, {grey = 0}, "Button")
	GUI:setAnchorPoint(Button_3, 0.50, 0.50)
	GUI:setTouchEnabled(Button_3, false)
	GUI:setTag(Button_3, -1)
	GUI:setSwallowTouches(Button_3, false)
end

return ui