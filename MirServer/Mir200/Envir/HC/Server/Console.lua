local Console={}
function Console.runcode(actor,code)
	local success,_ret=HC.runcode(code,setmetatable({},{__index=_G}))
	local ret=HC.serialize_tuple(HC.unpacklen(_ret))
	local spec={code=code,success=success,ret=ret}
	Console.save(actor,spec)
	return spec
	-- Clients[actor].Console.last = spec
	-- Clients[actor].Console.update(spec)
end
function Console.save(actor,spec)
	setplaydef(actor,VarName.T(254),Json.encode(spec))
end
function Console._sync(actor)
	Clients[actor].Console.last=Json.decode(getplaydef(actor,VarName.T(254)))
end
Event.add(Reg.sync,{
	fn=function(actor)
		Console._sync(actor)
	end,
})
Server.Console=Console
return Console