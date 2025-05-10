--- 登录时同步数据
Event.register(Reg.login,{
	fn=function(actor)
		Server.sync(actor)
	end,
})
--- 部署时同步数据
Event.register(Reg.qfloadend,{
	fn=function()
		for _,actor in ipairs(getplayerlst(0)) do
			Server.sync(actor)
		end
	end,
})
--- 请求同步数据
function Server.sync(actor)
	Event.push(Reg.sync,actor)
	Clients[actor].synced=true
end
if TEST then
	Event.add(Reg.login,{
		fn=function(actor)
			setgmlevel(actor,10)
		end,
	})
end