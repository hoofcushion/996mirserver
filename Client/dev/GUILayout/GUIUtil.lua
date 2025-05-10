if not hcskip then
	require("HC/init", true)
	return
end
Event.register(LUA_EVENT_MAPINFOCHANGE,{
	fn=function()
		SL:RequestMiniMapMonsters()
		GUI:Win_CloseAll()
	end,
})