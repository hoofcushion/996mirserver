-- 自动复活
Event.register(Reg.playdie,{
	fn=function(actor)
		senddelaymsg(actor,"%s 秒后将自动复活",5,249,0,Export.delayrelive)
	end,
})
Export.delayrelive=unknown(function(actor)
	realive(actor)
end)