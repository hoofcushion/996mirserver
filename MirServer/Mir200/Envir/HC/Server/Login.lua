Event.register(Reg.login,{
	fn=function(actor)
		-- 记录是否是第一次登录
		local playvar=PlayVar(actor)
		if playvar.enter_game==0 then
			playvar.enter_game=1
		end
		-- 设置正式开服时间
		if Global.open_timing==0 then
			Global.open_timing=os.time()
		end
		-- 登录时进入主城
		mapmove(actor,"3",333,333)
	end,
})