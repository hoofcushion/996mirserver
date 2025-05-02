package.path=package.path..";./Envir/?.lua"..";./Envir/?/init.lua"
require("HC/hc",    true)
require("HC/common",true)
if Common.is_server then
	require("HC/server",true)
	for _,file in ipairs(getenvirfilelist()) do
		file=string.gsub(file,"\\","/")
		if string.find(file,"^HC/Server/.+%.lua$") then
			file=string.gsub(file,"%.lua$","")
			require(file,true)
		end
	end
elseif Common.is_client then
	require("HC/client",true)
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
			require(file,true)
		end
	end)
end