local Console = {}
function Console.init(parent)
	local sw, sh = Meta.SCREEN_WIDTH, Meta.SCREEN_HEIGHT
	local w, h = sw / 4 * 3, sw / 4 * 3 / 1.618
	local margin = 10
	local ow, oh = w + margin * 2, h + margin * 2
	local Node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
	GUI:setTag(Node, -1)

	-- Create ImageView
	local ImageView = BaseUI.ImageView(Node, "ImageView")
	GUI:Image_loadTexture(ImageView, "res/public/bg_npc_08.jpg")
	GUI:Image_setScale9Slice(ImageView, 10, 10, 10, 10)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setContentSize(ImageView, w + margin * 2, h + margin * 2)
	GUI:setAnchorPoint(ImageView, 0.50, 0.50)
	GUI:setTouchEnabled(ImageView, true)

	local TextInput = GUI:TextInput_Create(Node, "TextInput", 0.00, 0.00, w, h / 2, 16)
	GUI:setAnchorPoint(TextInput, 0.50, 0.00)

	local TextOutput = GUI:TextInput_Create(Node, "TextOutput", 0.00, 0.00, w, h / 2, 16)
	GUI:setAnchorPoint(TextOutput, 0.50, 1.00)

	local RunClient = BaseUI.Button(Node, "RunClient", ow / 2, -oh / 2)
	GUI:setAnchorPoint(RunClient, 0, -1)
	GUI:Button_setTitleText(RunClient, "RunClient")

	local RunServer = BaseUI.Button(Node, "RunServer", ow / 2, -oh / 2)
	GUI:setAnchorPoint(RunServer, 0, 0)
	GUI:Button_setTitleText(RunServer, "RunServer")
end

function Console.main(npcid)
	Console.window = Window(Reg.Teleporter, npcid)
	Console.tree = GUI:ui_delegate(Console.window)

	Console.init(Console.window)
	GUI:Win_SetDrag(Console.window, Console.tree.BackGround)
	local w, h = SL:GetMetaValue("SCREEN_WIDTH"), SL:GetMetaValue("SCREEN_HEIGHT")
	GUI:setPosition(Console.tree.Node, w / 2, h / 2)
	WindowAnimate(Console.window)


	GUI:addOnClickEvent(Console.tree.RunClient, function()
		local code = GUI:TextInput_getString(Console.tree.TextInput)
		local success, ret = HC.runcode(code, setmetatable({}, { __index = _G }))
		ret = HC.serialize_tuple(HC.unpacklen(ret))
		local spec = { code = code, success = success, ret = ret }
		Console.last = spec
		Server.Console.save(spec)
		Console.update(spec)
	end)

	GUI:addOnClickEvent(Console.tree.RunServer, function()
		local code = GUI:TextInput_getString(Console.tree.TextInput)
		Server.Console.runcode(code)
	end)

	if Console.last then
		Console.update(Console.last)
	end
end

function Console.update(spec)
	if GUI:Win_IsNull(Console.window) then
		return
	end
	local code = spec.code
	GUI:TextInput_setString(Console.tree.TextInput, code)
	local success, ret = spec.success, spec.ret

	GUI:TextInput_setString(Console.tree.TextOutput, ([[Status: %s
	Result: %s
]]):format(success and "Success" or "Failed", ret))
end

GUI:addKeyboardEvent({ "KEY_CTRL", "KEY_0" }, function()
	Console.main()
end)

-- Export API namespace
Client.Console = Console

return Console
