local Console = {}

function Console.runcode(actor, code)
	local ret = HC.serialize_tuple(HC.nilpcall(HC.runcode(code, setmetatable({}, { __index = _G }))))
	Console.save(actor, code, ret)
	Console._sync(actor)
	Clients[actor].Console.update()
end

function Console.save(actor, code, ret)
	setplaydef(actor, VarType.T(254), HC.encode({ code = code, ret = ret }))
	Console._sync(actor)
end

function Console._sync(actor)
	Clients[actor].Console.last = getplaydef(actor, VarType.T(254))
end

Event.add(Reg.sync, {
	fn = function(actor)
		Console._sync(actor)
	end
})

Server.Console = Console
return Console
