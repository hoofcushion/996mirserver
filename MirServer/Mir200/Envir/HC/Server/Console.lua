local Console = {}

function Console.runcode(actor, code)
	local success, ret = HC.runcode(code, setmetatable({ actor = actor }, { __index = _G }))
	ret = HC.serialize_tuple(HC.unpacklen(ret))
	local spec = { code = code, success = success, ret = ret }
	Console.save(actor, spec)
	Clients[actor].Console.update(spec)
end

function Console.save(actor, spec)
	setplaydef(actor, VarType.T(254), Json.encode(spec))
end

function Console._sync(actor)
	Clients[actor].Console.last = Json.decode(getplaydef(actor, VarType.T(254)))
end

Event.add(Reg.sync, {
	fn = function(actor)
		Console._sync(actor)
	end
})

Server.Console = Console
return Console
