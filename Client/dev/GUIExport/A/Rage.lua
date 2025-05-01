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

	-- Create Node_Page_Buttons
	local Node_Page_Buttons = GUI:Node_Create(Background, "Node_Page_Buttons", 0.00, 169.00)
	GUI:setTag(Node_Page_Buttons, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_Page_Buttons, "Button_1", 0.00, 0.00, "res/public/1900000640_1.png")
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
	local RText = GUI:RichText_Create(Button_1, "RText", 20.00, 60.00, "龙的传人", 32, 14, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setAnchorPoint(RText, 0.50, 0.50)
	GUI:setTag(RText, -1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_Page_Buttons, "Button_2", 0.00, 0.00, "res/public/1900000640_1.png")
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
	local RText = GUI:RichText_Create(Button_2, "RText", 20.00, 60.00, "横扫千军", 32, 14, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setAnchorPoint(RText, 0.50, 0.50)
	GUI:setTag(RText, -1)

	-- Create Node_Pages
	local Node_Pages = GUI:Node_Create(Node, "Node_Pages", 0.00, 0.00)
	GUI:setTag(Node_Pages, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Node_Pages, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, -1)

	-- Create Button
	local Button = GUI:Button_Create(Node_1, "Button", 0.00, -100.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button, "激活")
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 16)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:Win_SetParam(Button, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button, 0.50, 0.50)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	-- Create RText
	local RText = GUI:RichText_Create(Node_1, "RText", -50.00, -55.00, "激活费用：", 200, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setAnchorPoint(RText, 0.50, 0.50)
	GUI:setTag(RText, -1)

	-- Create Item_Cost
	local Item_Cost = GUI:ItemShow_Create(Node_1, "Item_Cost", 20.00, -55.00, {count = 1, index = 1, look = true, bgVisible = true})
	GUI:setAnchorPoint(Item_Cost, 0.50, 0.50)
	GUI:setTag(Item_Cost, -1)
	GUI:ItemShow_setItemTouchSwallow(Item_Cost, true)

	-- Create RText_1
	local RText_1 = GUI:RichText_Create(Node_1, "RText_1", 0.00, 120.00, "<font color='#FF0000'>金币回收比例+30%</font><br>攻魔道+5%<br>生命值+5%<br>沙巴克攻城期间不掉<br>被龙的传人击杀后，被击杀玩家龙的传人消失", 420, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setAnchorPoint(RText_1, 0.50, 1.00)
	GUI:setTag(RText_1, -1)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(Node_Pages, "Node_2", 0.00, 0.00)
	GUI:setTag(Node_2, -1)
	GUI:setVisible(Node_2, false)

	-- Create Button
	local Button = GUI:Button_Create(Node_2, "Button", 0.00, -100.00, "res/public/1900000673.png")
	GUI:Button_loadTexturePressed(Button, "res/public/1900000674.png")
	GUI:Button_loadTextureDisabled(Button, "res/public/1900000674.png")
	GUI:Button_setTitleText(Button, "激活")
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 16)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:Win_SetParam(Button, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button, 0.50, 0.50)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	-- Create RText
	local RText = GUI:RichText_Create(Node_2, "RText", -50.00, -55.00, "激活费用：", 200, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setAnchorPoint(RText, 0.50, 0.50)
	GUI:setTag(RText, -1)

	-- Create Item_Cost
	local Item_Cost = GUI:ItemShow_Create(Node_2, "Item_Cost", 20.00, -55.00, {count = 1, index = 1, look = true, bgVisible = true})
	GUI:setAnchorPoint(Item_Cost, 0.50, 0.50)
	GUI:setTag(Item_Cost, -1)
	GUI:ItemShow_setItemTouchSwallow(Item_Cost, true)

	-- Create RText_1
	local RText_1 = GUI:RichText_Create(Node_2, "RText_1", 0.00, 120.00, "<font color='#FF0000'>吸血+3%</font><br>杀怪爆率+20%<br>几率禁锢敌人3*3范围2秒<br>沙巴克攻城期间不掉<br>被横扫千军玩家击杀后，被击杀玩家横扫千军消失", 420, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setAnchorPoint(RText_1, 0.50, 1.00)
	GUI:setTag(RText_1, -1)
end

return ui