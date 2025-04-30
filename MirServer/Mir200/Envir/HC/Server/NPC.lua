NPCScriptMap = {}
for _, info in ipairs(get_all_npc_info()) do
	NPCScriptMap[info.id] = info.script
end


NPCFuncMap = {
	["主城传送员"] = "Teleporter",
	["幸运项链"] = "LuckyNecklace",
	["黄金武器锻造"] = "Craft1"
}

Event.add(Reg.sync, {
	fn = function(actor)
		Clients[actor].NPCScriptMap = NPCScriptMap
		Clients[actor].NPCFuncMap = NPCFuncMap
	end
})
