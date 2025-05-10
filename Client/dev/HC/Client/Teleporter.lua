local Teleporter={}
---@type TeleporterCfg
Teleporter.cfg=nil
function Teleporter.main(npcid)
	return Window({
		id=Reg.Teleporter,
		npcid=npcid,
		init=function(window)
			Teleporter.window=window
			Teleporter.tree=GUI:ui_delegate(Teleporter.window)
			GUI:LoadExport(Teleporter.window,"A/Teleporter")
			GUI:Win_SetDrag(Teleporter.window,Teleporter.tree.Background)
			local w,h=SL:GetMetaValue("SCREEN_WIDTH"),SL:GetMetaValue("SCREEN_HEIGHT")
			GUI:setPosition(Teleporter.tree.Node,w/2,h/2)
			GUI:addOnClickEvent(Teleporter.tree.Button_Close,function()
				GUI:Win_Close(Teleporter.window)
			end)
			for i,button in GetAllByPrefix(Teleporter.tree.Node_1,"Button") do
				GUI:Button_setTitleText(button,Teleporter.cfg[i].title)
				GUI:addOnClickEvent(button,function()
					Server.Teleporter.teleport(i)
				end)
			end
		end,
	})
end
Client.Teleporter=Teleporter
return Teleporter