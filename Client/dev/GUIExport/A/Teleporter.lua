local ui = {}

function ui.init(parent)
	-- Create Node
	local Node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
	GUI:setTag(Node, -1)

	-- Create Background
	local Background = GUI:Image_Create(Node, "Background", 0.00, 0.00, "res/public/bg_npc_08.jpg")
	GUI:setAnchorPoint(Background, 0.50, 0.50)
	GUI:setTouchEnabled(Background, true)
	GUI:setTag(Background, -1)

	-- Create Button_Close
	local Button_Close = GUI:Button_Create(Node, "Button_Close", 203.00, 133.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(Button_Close, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(Button_Close, "res/public/1900000511.png")
	GUI:Button_setTitleText(Button_Close, "")
	GUI:Button_setTitleColor(Button_Close, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Close, 14)
	GUI:Button_titleEnableOutline(Button_Close, "#000000", 1)
	GUI:Win_SetParam(Button_Close, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_Close, 0.00, 1.00)
	GUI:setTouchEnabled(Button_Close, true)
	GUI:setTag(Button_Close, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Node, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", -115.00, 75.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_1, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:Win_SetParam(Button_1, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_1, "Button_2", 0.00, 75.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_2, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:Win_SetParam(Button_2, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_2, 0.50, 0.50)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, -1)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_1, "Button_3", 115.00, 75.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_3, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_3, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_3, "")
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:Win_SetParam(Button_3, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_3, 0.50, 0.50)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, -1)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Node_1, "Button_4", -115.00, 0.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_4, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_4, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_4, "")
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:Win_SetParam(Button_4, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_4, 0.50, 0.50)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, -1)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Node_1, "Button_5", 0.00, 0.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_5, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_5, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_5, "")
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:Win_SetParam(Button_5, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_5, 0.50, 0.50)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, -1)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(Node_1, "Button_6", 115.00, 0.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_6, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_6, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_6, "")
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:Win_SetParam(Button_6, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_6, 0.50, 0.50)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, -1)
end

return ui