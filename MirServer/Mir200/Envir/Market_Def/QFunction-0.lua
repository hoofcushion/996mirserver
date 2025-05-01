package.path=package.path..";./Envir/?.lua"..";./Envir/?/init.lua"
require("HC/init",                true)
require("HC/common",              true)
require("HC/Server/init",         true)
require("HC/Server/Console",      true)
require("HC/Server/Teleporter",   true)
require("HC/Server/LuckyNecklace",true)
require("HC/Server/Realive",      true)
require("HC/Server/Craft1",       true)
require("HC/Server/Rage",         true)
require("HC/Server/NPC",          true)
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
		-- 登录自动复活
		if getbaseinfo(actor,0)==true then
			realive(actor)
		end
		-- 登录时进入主城
		mapmove(actor,"3",333,333)
	end,
})
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
end
if TEST then
	Event.add(Reg.login,{
		fn=function(actor)
			setgmlevel(actor,10)
		end,
	})
end