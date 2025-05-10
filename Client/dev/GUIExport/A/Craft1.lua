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

	-- Create Node_Pages
	local Node_Pages = GUI:Node_Create(Background, "Node_Pages", 0.00, 169.00)
	GUI:setTag(Node_Pages, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_Pages, "Button_1", 0.00, 0.00, "res/public/1900000640_1.png")
	GUI:Button_loadTexturePressed(Button_1, "res/public/1900000641_1.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:Win_SetParam(Button_1, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_1, 1.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)

	-- Create RText
	local RText = GUI:RichText_Create(Button_1, "RText", 20.00, 60.00, "武器", 16, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setAnchorPoint(RText, 0.50, 0.50)
	GUI:setTag(RText, -1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_Pages, "Button_2", 0.00, 0.00, "res/public/1900000640_1.png")
	GUI:Button_loadTexturePressed(Button_2, "res/public/1900000641_1.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:Win_SetParam(Button_2, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_2, 1.00, 1.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, -1)

	-- Create RText
	local RText = GUI:RichText_Create(Button_2, "RText", 20.00, 60.00, "技能", 16, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setAnchorPoint(RText, 0.50, 0.50)
	GUI:setTag(RText, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Node, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", 110.00, 70.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_1, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_1, "锻造")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:Win_SetParam(Button_1, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_1, "Button_2", 110.00, 0.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_2, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_2, "锻造")
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:Win_SetParam(Button_2, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_2, 0.50, 0.50)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, -1)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_1, "Button_3", 110.00, -70.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button_3, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button_3, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button_3, "锻造")
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 14)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:Win_SetParam(Button_3, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_3, 0.50, 0.50)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, -1)

	-- Create Node_ItemShows
	local Node_ItemShows = GUI:Node_Create(Node, "Node_ItemShows", 0.00, 0.00)
	GUI:setTag(Node_ItemShows, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Node_ItemShows, "Node_1", -50.00, 70.00)
	GUI:setTag(Node_1, -1)

	-- Create Item_1
	local Item_1 = GUI:ItemShow_Create(Node_1, "Item_1", -100.00, 0.00, {index = 1, count = 1, look = true, bgVisible = true})
	GUI:setAnchorPoint(Item_1, 0.50, 0.50)
	GUI:setTag(Item_1, -1)

	-- Create Item_2
	local Item_2 = GUI:ItemShow_Create(Node_1, "Item_2", -50.00, 0.00, {index = 1, count = 1, look = true, bgVisible = true})
	GUI:setAnchorPoint(Item_2, 0.50, 0.50)
	GUI:setTag(Item_2, -1)

	-- Create Item_3
	local Item_3 = GUI:ItemShow_Create(Node_1, "Item_3", 0.00, 0.00, {look = true, count = 1, bgVisible = true, index = 1})
	GUI:setAnchorPoint(Item_3, 0.50, 0.50)
	GUI:setTag(Item_3, -1)

	-- Create Item_Out
	local Item_Out = GUI:ItemShow_Create(Node_1, "Item_Out", 75.00, 0.00, {index = 1, count = 1, look = true, bgVisible = true})
	GUI:setAnchorPoint(Item_Out, 0.50, 0.50)
	GUI:setTag(Item_Out, -1)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(Node_ItemShows, "Node_2", -50.00, 0.00)
	GUI:setTag(Node_2, -1)

	-- Create Item_1
	local Item_1 = GUI:ItemShow_Create(Node_2, "Item_1", -100.00, 0.00, {look = true, count = 1, bgVisible = true, index = 1})
	GUI:setAnchorPoint(Item_1, 0.50, 0.50)
	GUI:setTag(Item_1, -1)

	-- Create Item_2
	local Item_2 = GUI:ItemShow_Create(Node_2, "Item_2", -50.00, 0.00, {look = true, count = 1, bgVisible = true, index = 1})
	GUI:setAnchorPoint(Item_2, 0.50, 0.50)
	GUI:setTag(Item_2, -1)

	-- Create Item_3
	local Item_3 = GUI:ItemShow_Create(Node_2, "Item_3", 0.00, 0.00, {bgVisible = true, count = 1, index = 1, look = true})
	GUI:setAnchorPoint(Item_3, 0.50, 0.50)
	GUI:setTag(Item_3, -1)

	-- Create Item_Out
	local Item_Out = GUI:ItemShow_Create(Node_2, "Item_Out", 75.00, 0.00, {look = true, count = 1, bgVisible = true, index = 1})
	GUI:setAnchorPoint(Item_Out, 0.50, 0.50)
	GUI:setTag(Item_Out, -1)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(Node_ItemShows, "Node_3", -50.00, -70.00)
	GUI:setTag(Node_3, -1)

	-- Create Item_1
	local Item_1 = GUI:ItemShow_Create(Node_3, "Item_1", -100.00, 0.00, {look = true, count = 1, bgVisible = true, index = 1})
	GUI:setAnchorPoint(Item_1, 0.50, 0.50)
	GUI:setTag(Item_1, -1)

	-- Create Item_2
	local Item_2 = GUI:ItemShow_Create(Node_3, "Item_2", -50.00, 0.00, {look = true, count = 1, bgVisible = true, index = 1})
	GUI:setAnchorPoint(Item_2, 0.50, 0.50)
	GUI:setTag(Item_2, -1)

	-- Create Item_3
	local Item_3 = GUI:ItemShow_Create(Node_3, "Item_3", 0.00, 0.00, {bgVisible = true, count = 1, index = 1, look = true})
	GUI:setAnchorPoint(Item_3, 0.50, 0.50)
	GUI:setTag(Item_3, -1)

	-- Create Item_Out
	local Item_Out = GUI:ItemShow_Create(Node_3, "Item_Out", 75.00, 0.00, {look = true, count = 1, bgVisible = true, index = 1})
	GUI:setAnchorPoint(Item_Out, 0.50, 0.50)
	GUI:setTag(Item_Out, -1)
end

return ui