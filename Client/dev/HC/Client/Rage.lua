--- Rage
local M={}
---@type Rage.cfg
M.cfg=nil
M.page=1
function M.main(npcid)
	return Window({
		id=Reg.Rage,
		npcid=npcid,
		init=function(window)
			M.window=window
			M.tree=GUI:ui_delegate(M.window)
			GUI:LoadExport(M.window,"A/Rage")
			GUI:Win_SetDrag(M.window,M.tree.Background)
			local w,h=SL:GetMetaValue("SCREEN_WIDTH"),SL:GetMetaValue("SCREEN_HEIGHT")
			GUI:setPosition(M.tree.Node,w/2,h/2)
			CloseButton(M.tree.Background)
			GUI:addOnClickEvent(M.tree.Button_Close,function()
				GUI:Win_Close(M.window)
			end)
			for i,button in GetAllByPrefix(M.tree.Node_Page_Buttons,"Button") do
				GUI:addOnClickEvent(button,function()
					M.page=i
					M.update()
				end)
			end
			M.update()
		end,
	})
end
function M.update()
	if GUI:Win_IsNull(M.window) then
		return
	end
	local cfg=M.cfg[M.page]
	for i,node in GetAllByPrefix(M.tree.Node_Pages,"Node") do
		GUI:setVisible(node,i==M.page)
		local tree=GUI:ui_delegate(node)
		local item_cost=tree.Item_Cost
		GUI:ItemShow_updateItem(item_cost,{
			itemData=MetaGet.ITEM_DATA(cfg.cost[1].id),
			count=cfg.cost[1].count,
			look=true,
			bgVisible=true,
		})
		GUI:addOnClickEvent(tree.Button,function()
			Server.Rage.activate(i)
		end)
	end
end
Client.Rage=M
return M