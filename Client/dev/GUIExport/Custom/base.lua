local ui = {}
function ui.init(parent)
	-- Create Layout
	local Layout = GUI:Layout_Create(parent, "Layout", 0.00, 0.00, 500.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(Layout, 1)
	GUI:Layout_setBackGroundColor(Layout, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Layout, 140)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create ListView
	local ListView = GUI:ListView_Create(parent, "ListView", 0.00, 0.00, 500.00, 200.00, 1)
	GUI:ListView_setBackGroundColorType(ListView, 1)
	GUI:ListView_setBackGroundColor(ListView, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView, 100)
	GUI:ListView_setGravity(ListView, 5)
	GUI:setTouchEnabled(ListView, true)
	GUI:setTag(ListView, -1)

	-- Create ScrollView
	local ScrollView = GUI:ScrollView_Create(parent, "ScrollView", 0.00, 0.00, 500.00, 200.00, 1)
	GUI:ScrollView_setBackGroundColorType(ScrollView, 1)
	GUI:ScrollView_setBackGroundColor(ScrollView, "#ff9664")
	GUI:ScrollView_setBackGroundColorOpacity(ScrollView, 100)
	GUI:ScrollView_setInnerContainerSize(ScrollView, 500.00, 200.00)
	GUI:setTouchEnabled(ScrollView, true)
	GUI:setTag(ScrollView, -1)

	-- Create PageView
	local PageView = GUI:PageView_Create(parent, "PageView", 0.00, 0.00, 500.00, 200.00)
	GUI:PageView_setBackGroundColorType(PageView, 1)
	GUI:PageView_setBackGroundColor(PageView, "#969664")
	GUI:PageView_setBackGroundColorOpacity(PageView, 100)
	GUI:setTouchEnabled(PageView, true)
	GUI:setTag(PageView, -1)

	-- Create Text
	local Text = GUI:Text_Create(parent, "Text", 0.00, 0.00, 16, "#ffffff", [[文本]])
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create BmpText
	local BmpText = GUI:BmpText_Create(parent, "BmpText", 0.00, 0.00, "#ffffff", [[Bmp文本]])
	GUI:setTouchEnabled(BmpText, false)
	GUI:setTag(BmpText, -1)

	-- Create TextAtlas
	local TextAtlas = GUI:TextAtlas_Create(parent, "TextAtlas", 0.00, 0.00, "./0123456789", "res/private/gui_edit/TextAtlas.png", 14, 18, ".")
	GUI:setTouchEnabled(TextAtlas, false)
	GUI:setTag(TextAtlas, -1)

	-- Create Input
	local Input = GUI:TextInput_Create(parent, "Input", 0.00, 0.00, 100.00, 25.00, 16)
	GUI:TextInput_setString(Input, "输入框")
	GUI:TextInput_setFontColor(Input, "#ffffff")
	GUI:setTouchEnabled(Input, true)
	GUI:setTag(Input, -1)

	-- Create RText
	local RText = GUI:RichText_Create(parent, "RText", 0.00, 0.00, "RText", 200, 12, "#ffffff", 2, nil, "fonts/font2.ttf")
	GUI:setTag(RText, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(parent, "ImageView", 0.00, 0.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Button
	local Button = GUI:Button_Create(parent, "Button", 0.00, 0.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_loadTexturePressed(Button, "res/private/gui_edit/Button_Press.png")
	GUI:Button_loadTextureDisabled(Button, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(Button, "Button")
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 14)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	-- Create CheckBox
	local CheckBox = GUI:CheckBox_Create(parent, "CheckBox", 0.00, 0.00, "res/private/gui_edit/CheckBox_Normal.png", "res/private/gui_edit/CheckBox_Press.png")
	GUI:CheckBox_setSelected(CheckBox, false)
	GUI:setTouchEnabled(CheckBox, true)
	GUI:setTag(CheckBox, -1)

	-- Create LoadingBar
	local LoadingBar = GUI:LoadingBar_Create(parent, "LoadingBar", 0.00, 0.00, "res/private/gui_edit/LoadingBar.png", 0)
	GUI:LoadingBar_setPercent(LoadingBar, 100)
	GUI:LoadingBar_setColor(LoadingBar, "#ffffff")
	GUI:setTouchEnabled(LoadingBar, false)
	GUI:setTag(LoadingBar, -1)

	-- Create Slider
	local Slider = GUI:Slider_Create(parent, "Slider", 0.00, 0.00, "res/private/gui_edit/Slider_Bg.png", "res/private/gui_edit/Slider_Bar.png", "res/private/gui_edit/Slider_Ball.png")
	GUI:Slider_setPercent(Slider, 0)
	GUI:setTouchEnabled(Slider, true)
	GUI:setTag(Slider, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(parent, "Effect", 0.00, 0.00, 4, 1, 0, 0, 0, 1)
	GUI:setTag(Effect, -1)

	-- Create Item
	local Item = GUI:ItemShow_Create(parent, "Item", 0.00, 0.00, {index = 1, count = 1, look = true, bgVisible = true})
	GUI:setTag(Item, -1)

	-- Create Node
	local Node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
	GUI:setTag(Node, -1)

	-- Create Model
	local Model = GUI:UIModel_Create(parent, "Model", 0.00, 0.00, 0, {notShowMold = 1, notShowHair = 1}, 1)
	GUI:setTag(Model, -1)

	-- Create EquipShow
	local EquipShow = GUI:EquipShow_Create(parent, "EquipShow", 0.00, 0.00, 1, false, {bgVisible = true, look = true})
	GUI:setTag(EquipShow, -1)
end
return ui