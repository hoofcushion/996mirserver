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
		-- ��¼�Ƿ��ǵ�һ�ε�¼
		local playvar=PlayVar(actor)
		if playvar.enter_game==0 then
			playvar.enter_game=1
		end
		-- ������ʽ����ʱ��
		if Global.open_timing==0 then
			Global.open_timing=os.time()
		end
		-- ��¼�Զ�����
		if getbaseinfo(actor,0)==true then
			realive(actor)
		end
		-- ��¼ʱ��������
		mapmove(actor,"3",333,333)
	end,
})
--- ��¼ʱͬ������
Event.register(Reg.login,{
	fn=function(actor)
		Server.sync(actor)
	end,
})
--- ����ʱͬ������
Event.register(Reg.qfloadend,{
	fn=function()
		for _,actor in ipairs(getplayerlst(0)) do
			Server.sync(actor)
		end
	end,
})
--- ����ͬ������
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