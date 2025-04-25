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

function print(...)
	local t = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		t[i] = tostring(v)
	end
	release_print(table.concat(t, "\t"))
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

xpcall(require, print, "Envir/HC.lua")

require("Envir/Lua/init.lua")

local Ev = {}
Ev.events = {}
function Ev.add(event, opts)
	opts = opts or {}
	assert_type("opts", opts, "table")
	assert_type("opts.fn", opts.fn, "function")
	assert_type("opts.priority", opts.priority, "number", true)
	Ev.events[event] = Ev.events[event] or {}
	local listeners = Ev.events[event]
	local pos = #listeners + 1
	for i, v in ipairs(listeners) do
		if (opts.priority or 0) >= v.priority then
			pos = pos - 1
			break
		end
	end
	table.insert(Ev.events[event], pos, { fn = opts.fn, priority = opts.priority or 0 })
end

function Ev.push(event, ...)
	local listeners = Ev.events[event]
	if not listeners then
		return
	end
	for k, v in pairs(listeners) do
		v.fn(...)
	end
end

function Ev.register(name)
	_G[name] = function(...)
		Ev.push(name, ...)
	end
end

local Reg = setmetatable({}, { __index = function(_, k) return k end })


local registers = {
	Reg.run,
	Reg.walk,
	Reg.login,
	Reg.qfloadend,
	Reg.playdie,
}

local Export = setmetatable({}, {
	__index = function(_, k)
		return "@" .. k
	end,
	__newindex = function(_, k, v)
		if not _G[k] then
			_G[k] = v
		end
	end
})

for _, v in ipairs(registers) do
	Ev.register(v)
end

Ev.add(Reg.run, {
	fn = function(actor)
		HC.tips("步数 +1", actor)
	end
})

Ev.add(Reg.login, {
	fn = function(actor)
		if getbaseinfo(actor, 0) == true then
			realive(actor)
		end
		humanhp(actor, "=", 1)
		setgmlevel(actor, 10)
		mapmove(actor, "3", 333, 333)
	end
})

Ev.add(Reg.qfloadend, {
	fn = function(...)
		for _, actor in ipairs(getplayerlst(0)) do
			Ev.push(Reg.login, actor)
		end
	end
})

-- 自动复活
Ev.add(Reg.playdie, {
	fn = function(actor)
		senddelaymsg(actor, "%s 秒后将自动复活", 5, 255, 0, Export.delayrelive)
	end
})
Export.delayrelive = function(actor)
	realive(actor)
end

Ev.add(Reg.clicknpc,{
	fn=function (...)
		print(...)
	end
})