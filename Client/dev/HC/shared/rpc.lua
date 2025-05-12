--- ---
--- RPC
--- * Async/Await API
--- * Pass arguments and return values between client and server with a simple proxy
--- ---

---@class deque<V>: { [integer]: V }
local deque={s=1,e=0,l={}}
---@generic T
---@param self deque<T>
---@param v T
function deque:append(v)
	self.e=self.e+1
	self.l[self.e]=v
end
function deque:cuthead()
	self.l[self.s]=nil
	self.s=self.s+1
end
function deque:_iter(i)
	i=i+1
	if i>self.e then
		return
	end
	return i,self.l[i]
end
function deque:iter()
	return deque._iter,self,self.s-1
end
function deque.new()
	return setmetatable({s=1,e=0,l={}},{__index=deque})
end
local Callback={}
Callback.uid=0
---@class Callback.spec
Callback._spec={
	uid=0,
	time=0,
	callback=function() end, ---@type function
	sig="",
}
Callback.expire=deque.new() ---@type deque<Callback.spec>
Callback.lookup={} ---@type table<integer,Callback.spec>
Callback.timeout=5
function Callback.getuid()
	Callback.uid=Callback.uid+1
	return Callback.uid
end
function Callback.register(uid,fn,sig)
	local spec={
		uid=uid,
		time=os.time(),
		callback=fn,
		sig=sig,
	}
	Callback.expire:append(spec)
	Callback.lookup[uid]=spec
end
function Callback.trigger(uid,sig,...)
	local handler=Callback.lookup[uid]
	if handler==nil then
		return
	end
	if sig~=handler.sig then
		return
	end
	Callback.lookup[uid]=nil
	return handler.callback(...)
end
function Callback.gc()
	for _,v in Callback.expire:iter() do
		if os.time()-v.time>Callback.timeout then
			Callback.lookup[v.uid]=nil
			Callback.expire:cuthead()
		else
			break
		end
	end
end
if Common.is_client then
	local actor=Meta.MAIN_ACTOR_ID
	if Callback_gc_id then
		SL:UnSchedule(Callback_gc_id)
	end
	Callback_gc_id=SL:Schedule(Callback.gc,1)
	local function node(keys,actor)
		return setmetatable({},{
			__index=HC.Cache.create(function(_,k)
				assert_type("key",k,"string")
				local new_keys=HC.deepcopy(keys)
				table.insert(new_keys,k)
				return node(new_keys,actor)
			end),
			__call=function(_,...)
				Common.log(
					("Client call: %s(%s)"):format(
						table.concat(keys,"."),
						table.concat(HC.map({...},tostring),", ")
					),
					actor)
				Common.sendmsg(
					Msg.call,
					Msg.call_call,
					0,
					0,
					Json.encode({keys,{{...},select("#",...)}}),
					actor
				)
			end,
		})
	end
	local function anode(keys,actor)
		return setmetatable({},{
			__index=HC.Cache.create(function(_,k)
				assert_type("key",k,"string")
				local new_keys=HC.deepcopy(keys)
				table.insert(new_keys,k)
				return anode(new_keys,actor)
			end),
			__call=function(_,...)
				Common.log(
					("Async client call: %s(%s)"):format(
						table.concat(keys,"."),
						table.concat(HC.map({...},tostring),", ")
					),
					actor)
				local uid=Callback.getuid()
				Common.sendmsg(
					Msg.call,
					Msg.call_call,
					0,
					uid,
					Json.encode({keys,{{...},select("#",...)}}),
					actor
				)
				return Await(function(callback)
					Callback.register(uid,callback,actor)
				end)
			end,
		})
	end

	-- call server function in client
	-- Server.Console.main(actor)
	---@type Server
	Server=HC.Cache.table(function(k)
		return node({k},actor)
	end)
	--- Async version
	---@type Server
	AServer=HC.Cache.table(function(k)
		return anode({k},actor)
	end)
	-- client api register
	---@class Client
	Client={}
	Event.register(Reg.handlerequest,{
		fn=function(msgid,action,_,uid,data)
			if msgid~=Msg.call then
				return
			end
			data=Json.decode(data)
			if action==Msg.call_newindex then
				if type(data)~="table"
				or type(data[1])~="table"
				or type(data[2])~="table"
				then
					return
				end
				local keys,keyset=data[1],data[2]
				local tmp=Client
				for _,v in ipairs(keys) do
					tmp=tmp[v]
					if tmp==nil then
						return
					end
				end
				local k,v=keyset[1],keyset[2]
				Common.log(
					("Client newindex: Client%s.%s=%s"):format(
						table.concat(keys,"."),
						k,
						HC.serialize_minimal(v)
					),
					actor)
				tmp[k]=v
			elseif action==Msg.call_call then
				if type(data)~="table"
				or type(data[1])~="table"
				or type(data[2])~="table"
				or type(data[2][1])~="table"
				or type(data[2][2])~="number"
				then
					return
				end
				local keys,arglist,argcount=data[1],data[2][1],data[2][2]
				local tmp=Client
				for _,v in ipairs(keys) do
					tmp=tmp[v]
					if tmp==nil then
						return
					end
				end
				Common.log(
					("Client API call: Client%s(%s)"):format(
						table.concat(keys,"."),
						table.concat(HC.map(HC.fill(arglist,1,argcount),HC.serialize_minimal),", ")
					),
					actor)
				ret=HC.packlen(tmp(HC.unpack(arglist,1,argcount)))
			elseif action==Msg.call_callback then
				if type(data)~="table"
				or type(data[1])~="table"
				or type(data[2])~="number"
				then
					return
				end
				Common.log(("Client callback: %s"):format(uid),actor)
				local arglist,argcount=data[1],data[2]
				ret=HC.packlen(Callback.trigger(uid,actor,HC.unpack(arglist,1,argcount)))
			end
			if action~=Msg.call_callback and uid~=0 then
				ret=ret or {}
				local arglist,argcount=ret,ret.n or 0
				ret.n=nil
				Common.sendmsg(
					Msg.call,
					Msg.call_callback,
					0,
					uid,
					Json.encode({arglist,argcount}),
					actor
				)
			end
		end,
	})
elseif Common.is_server then
	Export.callback_gc=unknown(Callback.gc)
	addscheduled("callbackgc","SEC","1",Export.callback_gc)
	local function node(keys,actor)
		return setmetatable({},{
			__index=HC.Cache.create(function(_,k)
				assert_type("key",k,"string")
				local new_keys=HC.deepcopy(keys)
				table.insert(new_keys,k)
				return node(new_keys,actor)
			end),
			__newindex=function(_,k,v)
				Common.log(
					("Client newindex: Client%s.%s=%s"):format(
						#keys>0 and "."..(table.concat(keys,".")) or "",
						tostring(k),
						tostring(v)
					),
					actor)
				Common.sendmsg(Msg.call,Msg.call_newindex,0,0,Json.encode({keys,{k,v}}),actor)
			end,
			__call=function(_,...)
				Common.log(
					("Client call: Client%s(%s)"):format(
						table.concat(keys,"."),
						table.concat(HC.map({...},tostring),", ")
					),
					actor)
				Common.sendmsg(
					Msg.call,
					Msg.call_call,
					0,
					0,
					Json.encode({keys,{{...},select("#",...)}}),
					actor
				)
			end,
		})
	end
	local function anode(keys,actor)
		return setmetatable({},{
			__index=HC.Cache.create(function(_ii,k)
				assert_type("key",k,"string")
				local new_keys=HC.deepcopy(keys)
				table.insert(new_keys,k)
				return anode(new_keys,actor)
			end),
			__newindex=function(_,k,v)
				Common.log(
					("Client newindex: Client%s.%s=%s"):format(
						#keys>0 and "."..(table.concat(keys,".")) or "",
						tostring(k),
						tostring(v)
					),
					actor)
				local uid=Callback.getuid()
				Common.sendmsg(Msg.call,Msg.call_newindex,0,uid,Json.encode({keys,{k,v}}),actor)
				return Await(function(callback)
					Callback.register(uid,callback,actor)
				end)
			end,
			__call=function(_,...)
				Common.log(
					("Client call: Client.%s(%s)"):format(
						table.concat(keys,"."),
						table.concat(HC.map({...},tostring),", ")
					),
					actor)
				local uid=Callback.getuid()
				Common.sendmsg(
					Msg.call,
					Msg.call_call,
					0,
					uid,
					Json.encode({keys,{{...},select("#",...)}}),
					actor
				)
				return Await(function(callback)
					Callback.register(uid,callback,actor)
				end)
			end,
		})
	end

	-- call client function in server
	-- Clients[actor].Console.init()
	---@type table<string,Client>
	Clients=HC.Cache.table(function(actor)
		return node({},actor)
	end)
	--- Async version
	---@type table<string,Client>
	AClients=HC.Cache.table(function(actor)
		return anode({},actor)
	end)
	-- server api register
	---@class Server
	Server={}
	Event.register(Reg.handlerequest,{
		fn=function(actor,msgid,action,_,uid,data)
			if msgid~=Msg.call then
				return
			end
			data=Json.decode(data)
			if action==Msg.call_newindex then
				Common.log(("Server newindex not allowed: %s=%s"),actor)
				return
			elseif action==Msg.call_call then
				if type(data)~="table"
				or type(data[1])~="table"
				or type(data[2])~="table"
				or type(data[2][1])~="table"
				or type(data[2][2])~="number"
				then
					return
				end
				local keys,arglist,argcount=data[1],data[2][1],data[2][2]
				local tmp=Server
				for _,v in ipairs(keys) do
					tmp=tmp[v]
					if tmp==nil
					or string.sub(v,1,1)=="_"
					then
						Common.log(("Invalid API index: %s"):format(table.concat(keys,".")),actor)
						return
					end
				end
				Common.log(
					("Server API call: Server.%s(%s)"):format(
						table.concat(keys,"."),
						table.concat(HC.map(HC.fill(arglist,1,argcount),HC.serialize_minimal),", ")
					),
					actor)
				ret=HC.packlen(tmp(actor,HC.unpack(arglist,1,argcount)))
			elseif action==Msg.call_callback then
				if type(data)~="table"
				or type(data[1])~="table"
				or type(data[2])~="number"
				then
					return
				end
				Common.log(("Server callback: %s"),actor)
				local arglist,argcount=data[1],data[2]
				ret=HC.packlen(Callback.trigger(uid,actor,HC.unpack(arglist,1,argcount)))
			end
			if action~=Msg.call_callback and uid~=0 then
				ret=ret or {}
				local arglist,argcount=ret,ret.n or 0
				ret.n=nil
				Common.sendmsg(
					Msg.call,
					Msg.call_callback,
					0,
					uid,
					Json.encode({arglist,argcount}),
					actor
				)
			end
		end,
	})
end