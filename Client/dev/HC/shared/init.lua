local function reload()
	if Common.is_server then
		xpcall(require,function(...) print(...) end,"Envir/Market_Def/QFunction-0",true)
	elseif Common.is_client then
		xpcall(require,function(...) print(...) end,"GUILayout/GUIUtil",true)
	end
end

function hcload(force)
	if force then
		hcskip=false
		reload()
		return
	end
	if not hcskip then
		if not (SL and GUI) then
			package.path=package.path..";./Envir/?.lua"..";./Envir/?/init.lua"
		end
		for modname in pairs(package.loaded) do
			if string.find(modname,"^HC") then
				package.loaded[modname]=nil
			end
		end
		require("HC/shared/hc")
		require("HC/shared/common")
		if Common.is_server then
			require("HC/Server/init")
			require("HC/shared/rpc")
			for _,file in ipairs(getenvirfilelist()) do
				file=string.gsub(file,"\\","/")
				if string.find(file,"^HC/Server/.+%.lua$") then
					file=string.gsub(file,"%.lua$","")
					print(file)
					require(file)
				end
			end
		elseif Common.is_client then
			require("HC/client/init")
			require("HC/shared/rpc")
			local function rec_get_files(path,fn)
				local files=SL:GetFilesByPath(path)
				if #files==0 then
					return
				end
				for _,file in ipairs(files) do
					rec_get_files(path.."/"..file,fn)
					fn(path.."/"..file)
				end
				return path
			end
			rec_get_files("./HC",function(file)
				file=string.gsub(file,"^%./","")
				if string.find(file,"^HC/Client/.+%.lua$") then
					file=string.gsub(file,"%.lua$","")
					require(file)
				end
			end)
		end
		hcskip=true
		reload()
		Event.push(Reg.HCLoadPost)
	end
end
hcload(false)