require("HC/init", true)
require("HC/Client/init", true)
require("HC/Client/Console", true)
require("HC/Client/Teleporter", true)


talking_npc = nil
SL:RegisterLUAEvent(LUA_EVENT_TALKTONPC, "GUIUtil", function(data)
	talking_npc = data
	local script = NPCScriptMap[talking_npc.index]
	if not script then
		return
	end
	local func = NPCFuncMap[script]
	if not func then
		return
	end
	local mod = Client[func]
	if not mod then
		return
	end
	mod.main(talking_npc.index)
end)

SL:RegisterLUAEvent(LUA_EVENT_ACTOR_OUT_OF_VIEW, "GUIUtil", function(data)
	if talking_npc.UserId == data.id then
		GUI:Win_CloseByNPCID(talking_npc.index)
	end
end)

SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, "GUIUtil", function(data)
	SL:RequestMiniMapMonsters()
	GUI:Win_CloseAll()
end)

SL:RegisterLUAEvent(LUA_EVENT_LEAVE_WORLD, "GUIUtil", function()
	for k, _ in pairs(package.loaded) do
		if string.find(k, "GUILayout") then
			package.loaded[k] = nil
			_G[k] = nil
		end
	end
end)

GUI:addKeyboardEvent({ "KEY_CTRL", "KEY_TAB" }, function()
	GUI:Win_CloseAll()
	SL:SendLuaNetMsg(0)
	for k, _ in pairs(package.loaded) do
		if string.find(k, "game/") or string.find(k, "scripts/") then
			package.loaded[k] = nil
			_G[k] = nil
		end
	end
	require("GUILayout/GUIUtil", true)
end)

local function format_system_tips(...)
	return HC.Serializer.new("compact")
					:serialize_tuple(...)
					:gsub("[<>]", {
						["<"] = "&lt;",
						[">"] = "&gt;",
					})
end

SL:RegisterLUAEvent(LUA_EVENT_TALKTONPC, "HC", function(...)
	SL:ShowSystemTips(format_system_tips(...))
end)
