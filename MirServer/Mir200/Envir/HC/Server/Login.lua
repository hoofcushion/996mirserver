Event.register(Reg.login,{
	fn=function(actor)
		-- ��¼�Ƿ��ǵ�һ�ε�¼
		local playvar=PlayVar(actor)
		if playvar.enter_game==0 then
			playvar.enter_game=1
		end
		-- ������ʽ����ʱ��
		if Global.open_timing==0 then
			Global.open_timing=os.time()
		end
		-- ��¼ʱ��������
		mapmove(actor,"3",333,333)
	end,
})