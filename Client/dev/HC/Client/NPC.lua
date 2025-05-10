Client.NPCScriptMap={}
Client.NPCFuncMap={}
--- 最后一个交谈的 npc
---@type {
--- index: number,
--- UserId: number,
--- Name: string,
---}
Talking_NPC=nil
Event.register(LUA_EVENT_TALKTONPC,{
	fn=function(data)
		Talking_NPC=data
		local script=Client.NPCScriptMap[Talking_NPC.index]
		if not script then
			print("No script found for NPC index "..Talking_NPC.index)
			return
		end
		local func=Client.NPCFuncMap[script]
		if not func then
			print("No function found for script "..script)
			return
		end
		local mod=Client[func]
		if not mod then
			print("No module found for function "..func)
			return
		end
		mod.main(Talking_NPC.index)
	end,
})
Event.register(LUA_EVENT_ACTOR_OUT_OF_VIEW,{
	fn=function(data)
		if Talking_NPC and Talking_NPC.UserId==data.id then
			GUI:Win_CloseByNPCID(Talking_NPC.index)
		end
	end,
})