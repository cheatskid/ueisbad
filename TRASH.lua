--[[ TRASH.lua — autoload Unnamed V3 Premium ]]
if getgenv().UnnamedV3_TRASH_Loading then return end
getgenv().UnnamedV3_TRASH_Loading = true

local URL = "https://raw.githubusercontent.com/cheatskid/ueisbad/main/unnamed.lua"

local function get(url)
	local ok, res = pcall(function()
		return game:HttpGet(url)
	end)
	if ok and type(res) == "string" and #res > 1000000 then
		return res
	end
	ok, res = pcall(function()
		return game:HttpGetAsync(url)
	end)
	if ok and type(res) == "string" and #res > 1000000 then
		return res
	end
	return nil, res
end

local src, err = get(URL)
if not src then
	getgenv().UnnamedV3_TRASH_Loading = nil
	error("[Unnamed] download failed: " .. tostring(err))
end

local fn, perr = (loadstring or load)(src)
getgenv().UnnamedV3_TRASH_Loading = nil
if not fn then
	error("[Unnamed] parse failed: " .. tostring(perr))
end

return fn()
