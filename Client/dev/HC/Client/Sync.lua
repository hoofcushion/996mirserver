Client.synced=nil
--- 部署时同步数据
Event.register(Reg.HCLoadPost,{
	fn=function()
		if not Client.synced then
			Server.sync()
		end
	end,
})