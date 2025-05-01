---@type MetaValueTable
Meta=setmetatable({},{
	__index=function(_,k)
		return SL:GetMetaValue(k)
	end,
	__newindex=function(_,k,v)
		SL:SetMetaValue(k,v)
	end,
})
---@class MetaGet
---@field [metavalue] function
MetaGet=setmetatable({},{
	__index=function(t,k)
		local fn=function(...)
			return SL:GetMetaValue(k,...)
		end
		rawset(t,k,fn)
		return fn
	end,
})
BaseUI={}
-- 基础布局创建函数
function BaseUI.Layout(parent,id,x,y,w,h)
	x=x or 0
	y=y or 0
	w=w or 500
	h=h or 200
	local layout=GUI:Layout_Create(parent,id,x,y,w,h,false)
	GUI:Layout_setBackGroundColorType(layout,1)
	GUI:Layout_setBackGroundColor(layout,"#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(layout,140)
	GUI:setTouchEnabled(layout,false)
	return layout
end
-- 创建 ListView
function BaseUI.ListView(parent,id,x,y,w,h)
	x=x or 0
	y=y or 0
	w=w or 500
	h=h or 200
	local listView=GUI:ListView_Create(parent,id,x,y,w,h,1)
	GUI:ListView_setBackGroundColorType(listView,1)
	GUI:ListView_setBackGroundColor(listView,"#9696ff")
	GUI:ListView_setBackGroundColorOpacity(listView,100)
	GUI:ListView_setGravity(listView,5)
	GUI:setTouchEnabled(listView,true)
	return listView
end
-- 创建 ScrollView
function BaseUI.ScrollView(parent,id,x,y,w,h)
	x=x or 0
	y=y or 0
	w=w or 500
	h=h or 200
	local scrollView=GUI:ScrollView_Create(parent,id,x,y,w,h,1)
	GUI:ScrollView_setBackGroundColorType(scrollView,1)
	GUI:ScrollView_setBackGroundColor(scrollView,"#ff9664")
	GUI:ScrollView_setBackGroundColorOpacity(scrollView,100)
	GUI:ScrollView_setInnerContainerSize(scrollView,w,h)
	GUI:setTouchEnabled(scrollView,true)
	return scrollView
end
-- 创建 PageView
function BaseUI.PageView(parent,id,x,y,w,h)
	x=x or 0
	y=y or 0
	w=w or 500
	h=h or 200
	local pageView=GUI:PageView_Create(parent,id,x,y,w,h)
	GUI:PageView_setBackGroundColorType(pageView,1)
	GUI:PageView_setBackGroundColor(pageView,"#969664")
	GUI:PageView_setBackGroundColorOpacity(pageView,100)
	GUI:setTouchEnabled(pageView,true)
	return pageView
end
-- 创建 Input
function BaseUI.Input(parent,id,x,y,w,h)
	x=x or 0
	y=y or 0
	w=w or 100
	h=h or 25
	local input=GUI:TextInput_Create(parent,id,x,y,w,h,16)
	GUI:TextInput_setString(input,"输入框")
	GUI:TextInput_setFontColor(input,"#ffffff")
	GUI:setTouchEnabled(input,true)
	return input
end
-- 创建 Slider
function BaseUI.Slider(parent,id,x,y,w,h)
	x=x or 0
	y=y or 0
	w=w or 200
	h=h or 20
	local slider=GUI:Slider_Create(parent,id,x,y,"res/private/gui_edit/Slider_Bg.png",
																																"res/private/gui_edit/Slider_Bar.png","res/private/gui_edit/Slider_Ball.png")
	GUI:Slider_setPercent(slider,0)
	GUI:setTouchEnabled(slider,true)
	return slider
end
-- 其他没有尺寸的控件保持不变
-- 创建 Text
function BaseUI.Text(parent,id,x,y)
	local text=GUI:Text_Create(parent,id,x,y,16,"#ffffff",[[文本]])
	GUI:setTouchEnabled(text,false)
	GUI:Text_enableOutline(text,"#000000",1)
	return text
end
-- 创建 BmpText
function BaseUI.BmpText(parent,id,x,y)
	local bmpText=GUI:BmpText_Create(parent,id,x,y,"#ffffff",[[Bmp文本]])
	GUI:setTouchEnabled(bmpText,false)
	return bmpText
end
-- 创建 TextAtlas
function BaseUI.TextAtlas(parent,id,x,y)
	local textAtlas=GUI:TextAtlas_Create(parent,id,x,y,"./0123456789","res/private/gui_edit/TextAtlas.png",14,
																																						18,".")
	GUI:setTouchEnabled(textAtlas,false)
	return textAtlas
end
-- 创建 RText
function BaseUI.RText(parent,id,x,y)
	local rText=GUI:RichText_Create(parent,id,x,y,"RText",200,12,"#ffffff",2,nil,"fonts/font2.ttf")
	return rText
end
-- 创建 ImageView
function BaseUI.ImageView(parent,id,x,y)
	local imageView=GUI:Image_Create(parent,id,x,y,"res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(imageView,false)
	return imageView
end
-- 创建 Button
function BaseUI.Button(parent,id,x,y)
	local button=GUI:Button_Create(parent,id,x,y,"res/private/gui_edit/Button_Normal.png")
	GUI:Button_loadTexturePressed(button,"res/private/gui_edit/Button_Press.png")
	GUI:Button_loadTextureDisabled(button,"res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(button,"Button")
	GUI:Button_setTitleColor(button,"#ffffff")
	GUI:Button_setTitleFontSize(button,14)
	GUI:Button_titleEnableOutline(button,"#000000",1)
	GUI:setTouchEnabled(button,true)
	return button
end
-- 创建 CheckBox
function BaseUI.CheckBox(parent,id,x,y)
	local checkBox=GUI:CheckBox_Create(parent,id,x,y,"res/private/gui_edit/CheckBox_Normal.png",
																																				"res/private/gui_edit/CheckBox_Press.png")
	GUI:CheckBox_setSelected(checkBox,false)
	GUI:setTouchEnabled(checkBox,true)
	return checkBox
end
-- 创建 LoadingBar
function BaseUI.LoadingBar(parent,id,x,y)
	local loadingBar=GUI:LoadingBar_Create(parent,id,x,y,"res/private/gui_edit/LoadingBar.png",0)
	GUI:LoadingBar_setPercent(loadingBar,100)
	GUI:LoadingBar_setColor(loadingBar,"#ffffff")
	GUI:setTouchEnabled(loadingBar,false)
	return loadingBar
end
-- 创建 Effect
function BaseUI.Effect(parent,id,x,y)
	local effect=GUI:Effect_Create(parent,id,x,y,4,1,0,0,0,1)
	return effect
end
-- 创建 Item
function BaseUI.Item(parent,id,x,y)
	local item=GUI:ItemShow_Create(parent,id,x,y,{index=1,count=1,look=true,bgVisible=true})
	return item
end
-- 创建 Node
function BaseUI.Node(parent,id,x,y)
	local node=GUI:Node_Create(parent,id,x,y)
	return node
end
-- 创建 Model
function BaseUI.Model(parent,id,x,y)
	local model=GUI:UIModel_Create(parent,id,x,y,0,{notShowMold=1,notShowHair=1},1)
	return model
end
-- 创建 EquipShow
function BaseUI.EquipShow(parent,id,x,y)
	local equipShow=GUI:EquipShow_Create(parent,id,x,y,1,false,{bgVisible=true,look=true})
	return equipShow
end
local function node(keys,actor)
	return setmetatable({},{
		__index=function(_,k)
			assert_type("key",k,"string")
			local new_keys=HC.deepcopy(keys)
			table.insert(new_keys,k)
			return node(new_keys,actor)
		end,
		__newindex=function(_,k,v)
			if Common.is_server then
				Common.sendmsg(Msg.call,1,0,0,Json.encode({keys,{k,v}}),actor)
			end
		end,
		__call=function(_,...)
			Common.sendmsg(Msg.call,0,0,0,Json.encode({keys,{...}}),actor)
		end,
	})
end

-- call server function in client
-- Server.Console.main(actor)
---@class Server
Server=setmetatable({},{
	__index=function(_,k)
		return node({k})
	end,
})
-- client api register
---@class Client
Client={}
SL:RegisterLuaNetMsg(Msg.call,function(_,id,_,_,data)
	data=Json.decode(data)
	if type(data)~="table"
	or type(data[1])~="table"
	or type(data[2])~="table"
	then
		return
	end
	local keys,args=data[1],data[2]
	local tmp=Client
	for _,v in ipairs(keys) do
		tmp=tmp[v]
		if tmp==nil
		or string.sub(v,1,1)=="_"
		then
			Common.log(("Invalid API call: %s"):format(table.concat(keys,".")))
			return
		end
	end
	if id==1 then
		local k,v=args[1],args[2]
		local value=v
		tmp[k]=value
	else
		tmp(HC.unpack(args))
	end
end)
function WindowAnimate(window)
	Job({
		function(callback)
			GUI:setScale(window,0.95); callback()
		end,
		function(callback) GUI:Timeline_ScaleTo(window,1.05,0.05,callback) end,
		function(callback) GUI:Timeline_ScaleTo(window,1,0.05,callback) end,
	})
end
--- 在给定的节点下创建一个黑色半透明 Layout 控件
--- 返回创建的控件
function CreateShadowMask(parent,maskon,opacity)
	local w,h=SL:GetMetaValue("SCREEN_WIDTH"),SL:GetMetaValue("SCREEN_HEIGHT")
	if maskon==nil then
		w=w*3
		h=h*3
	else
		local size=GUI:getContentSize(maskon)
		w=size.width
		h=size.height
	end
	-- Create bg_close
	local v=GUI:Layout_Create(parent,"shadow_mask",0.00,0.00,w,h,false)
	if (opacity~=nil and opacity~=0) or opacity==nil then
		GUI:Layout_setBackGroundColorType(v,1)
		GUI:Layout_setBackGroundColor(v,"#000000")
		GUI:Layout_setBackGroundColorOpacity(v,math.floor(opacity or (255/2)))
	end
	GUI:setAnchorPoint(v,0.5,0.5)
	GUI:setTouchEnabled(v,true)
	GUI:setTag(v,-1)
	return v
end
function Window(id,npcid)
	local window=GUI:Win_Create(id)
	if npcid then
		GUI:Win_BindNPC(window,npcid)
	end
	GUI:Win_SetESCClose(window,true)
	GUI:addOnClickEvent(CreateShadowMask(window),function()
		GUI:Win_Close(window)
	end)
	WindowAnimate(window)
	return window
end
SL:RegisterLuaNetMsg(0,function(_,_,_,_,code)
	HC.runcode(code)
end)
-- 遍历指定节点下所有带有指定前缀的控件
-- 例子：
-- 遍历 ui 节点下所有 btn 前缀的控件
-- for i,v in GetAllByPrefix(ui, "btn") do
-- -- do something
-- end
---@param widget userdata|table # 节点
---@param prefix string # 前缀
function GetAllByPrefix(widget,prefix,i,e)
	i=i or 0
	return coroutine.wrap(function()
		local start=GUI:getChildByName(widget,prefix.."_"..i)
		if start~=nil then
			i=i+1
			coroutine.yield(i,start)
		end
		while true do
			i=i+1
			local v=GUI:getChildByName(widget,prefix.."_"..i)
			if v==nil then
				return
			end
			coroutine.yield(i,v)
			if i==e then
				return
			end
		end
	end)
end
function CloseButton(Background)
	local BackGroundsize=GUI:getContentSize(Background)
	local Button_Close=GUI:Button_Create(Background,"Button_Close",BackGroundsize.width,BackGroundsize.height,
																																						"res/public/1900000510.png")
	GUI:Button_loadTexturePressed(Button_Close,"res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(Button_Close,"res/public/1900000511.png")
	GUI:Button_setTitleText(Button_Close,"")
	GUI:Button_setTitleColor(Button_Close,"#ffffff")
	GUI:Button_setTitleFontSize(Button_Close,14)
	GUI:Button_titleEnableOutline(Button_Close,"#000000",1)
	GUI:setAnchorPoint(Button_Close,0.00,1.00)
	GUI:setTouchEnabled(Button_Close,true)
	GUI:setTag(Button_Close,-1)
	return Button_Close
end