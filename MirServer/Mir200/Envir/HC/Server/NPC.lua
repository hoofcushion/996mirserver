NPCScriptMap = {}
for _, info in ipairs(get_all_npc_info()) do
	NPCScriptMap[info.id] = info.script
end


NPCFuncMap = {
	["���Ǵ���Ա"] = "Teleporter",
	["��������"] = "LuckyNecklace",
	["�ƽ���������"] = "Craft1"
}

Event.add(Reg.sync, {
	fn = function(actor)
		Clients[actor].NPCScriptMap = NPCScriptMap
		Clients[actor].NPCFuncMap = NPCFuncMap
	end
})
