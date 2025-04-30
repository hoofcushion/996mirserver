require("HC/init", true)
require("HC/common", true)
require("HC/Client/init", true)
require("HC/Client/Console", true)
require("HC/Client/Teleporter", true)
require("HC/Client/LuckyNecklace", true)
require("HC/Client/Craft1", true)
require("HC/Client/NPC", true)

SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, "GUIUtil", function(data)
	SL:RequestMiniMapMonsters()
	GUI:Win_CloseAll()
end)

if TEST then
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
		SL:SendLuaNetMsg(Msg.sync)
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
end
