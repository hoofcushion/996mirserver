-- 自动复活
Event.register(Reg.playdie,{
	fn=function(actor)
		senddelaymsg(actor,"%s 秒后将自动复活",5,249,0,Export.delayrelive)
	end,
})
Export.delayrelive=unknown(function(actor)
	realive(actor)
end)
Event.register(Reg.delayrelive,{
	fn=function(actor)
		-- 登录自动复活
		if getbaseinfo(actor,0)==true then
			realive(actor)
		end
	end,
})