-- �Զ�����
Event.register(Reg.playdie,{
	fn=function(actor)
		senddelaymsg(actor,"%s ����Զ�����",5,249,0,Export.delayrelive)
	end,
})
Export.delayrelive=unknown(function(actor)
	realive(actor)
end)
Event.register(Reg.delayrelive,{
	fn=function(actor)
		-- ��¼�Զ�����
		if getbaseinfo(actor,0)==true then
			realive(actor)
		end
	end,
})