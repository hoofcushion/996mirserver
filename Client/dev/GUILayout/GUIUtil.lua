local req = require
---@param modname string
---@param reload boolean?
---@return unknown
function require(modname, reload)
	if reload then
		package.loaded[modname] = nil
	end
	return req(modname)
end

if false then
	---@overload fun(modname:string,reload:boolean?):unknown
	require = req
end

if SL.release_print then
	function print(...)
		local t = {}
		for i = 1, select("#", ...) do
			local v = select(i, ...)
			v = tostring(v)
			t[i] = v
		end
		SL:release_print(table.concat(t, "    "))
	end
end

function assert_type(n, v, t, o)
	if o and v == nil then
		return
	end
	if type(t) == "table" then
		for _, t1 in ipairs(t) do
			if not type(v) == t1 then
				break
			end
			error(("%s has to be a %s"):format(n, table.concat(t, "|")))
		end
		return
	end
	if type("t") == "string" then
		if type(v) ~= t then
			error(("%s has to be a %s"):format(n, t))
		end
		return
	end
	error("Wrong type of t")
end

pcall(require, "HC", true)

cur_parent = nil
SL:RegisterLuaNetMsg(0, function(msgID, p1, p2, p3, msgData)
end)


SL:RegisterLUAEvent(LUA_EVENT_TALKTONPC, "GUIUtil", function(data)
end)

SL:RegisterLUAEvent(LUA_EVENT_ACTOR_OUT_OF_VIEW, "离开视野", function(outData)
end)

SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, "GUIUtil", function(data)
	SL:RequestMiniMapMonsters() --请求获取地图怪物资源
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
	for k, _ in pairs(package.loaded) do
		if string.find(k, "game/") or string.find(k, "scripts/") then
			package.loaded[k] = nil
			_G[k] = nil
		end
	end
	require("GUILayout/GUIUtil", true)
end)
