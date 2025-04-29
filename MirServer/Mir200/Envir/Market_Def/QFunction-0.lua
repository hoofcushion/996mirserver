require("Envir/HC/init", true)
require("Envir/HC/Server/init", true)
require("Envir/HC/Server/Console", true)
require("Envir/HC/Server/Teleporter", true)

Event.register(Reg.login, {
	fn = function(actor)
		Event.push(Reg.sync, actor)
		-- 记录第一次登录
		local playvar = PlayVar(actor)
		if playvar.enter_game == 0 then
			playvar.enter_game = 1
		end
		-- 设置正式开服时间
		if Global.open_timing == 0 then
			Global.open_timing = os.time()
		end
		-- 登录自动复活
		if getbaseinfo(actor, 0) == true then
			realive(actor)
		end
		mapmove(actor, "3", 333, 333)
	end
})

Event.register(Reg.handlerequest, {
	fn = function(actor, msgid)
		if msgid == 0 then
			Event.push(Reg.sync, actor)
		end
	end
})

function Sync(key, value)
	Event.add(Reg.sync, {
		fn = function(actor)
			client_run(actor, key .. "=" .. HC.serialize_minimal(value))
		end
	})
end

Event.register(Reg.qfloadend, {
	fn = function()
		for _, actor in ipairs(getplayerlst(0)) do
			Event.push(Reg.sync, actor)
		end
	end
})

-- 自动复活
Event.register(Reg.playdie, {
	fn = function(actor)
		senddelaymsg(actor, "%s 秒后将自动复活", 5, 249, 0, Export.delayrelive)
	end
})

Export.delayrelive = unknown(function(actor)
	realive(actor)
end)

NPCScriptMap = {}
for _, info in ipairs(get_all_npc_info()) do
	NPCScriptMap[info.id] = info.script
end

Sync(Reg.NPCScriptMap, NPCScriptMap)

NPCFuncMap = {
	["主城传送员"] = "Teleporter",
	["幸运项链"] = "LuckyNecklace"
}

Sync(Reg.NPCFuncMap, NPCFuncMap)

Event.add(Reg.sync, {
	fn = function(actor)
		setgmlevel(actor, 10)
	end
})
