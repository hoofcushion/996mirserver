Event.register(Reg.HCLoadPost,{
	fn=function()
		if TEST then
			Event.register(LUA_EVENT_LEAVE_WORLD,{
				fn=function()
					for k,_ in pairs(package.loaded) do
						if string.find(k,"GUILayout") then
							package.loaded[k]=nil
							_G[k]=nil
						end
					end
				end,
			})
			GUI:addKeyboardEvent({"KEY_CTRL","KEY_TAB"},function()
				hcload(true)
			end)
			local function format_system_tips(...)
				return HC.Serializer.new("compact")
					:serialize_tuple(...)
					:gsub("[<>]",{
						["<"]="&lt;",
						[">"]="&gt;",
					})
			end

			Event.register(LUA_EVENT_TALKTONPC,{
				fn=function(...)
					Common.tips(format_system_tips(...))
				end,
			})
		end
	end,
})