local url = "https://raw.githubusercontent.com/altwebsites/hack.lua/main/main.lua" -- Put your copied link here

local success, result = pcall(function()
    return game:HttpGet(url)
end)

if success then
    print("Success! Code found. Running now...")
    loadstring(result)()
else
    warn("HTTP Error: " .. tostring(result))
    print("Make sure your Repo is PUBLIC and the link is RAW.")
end
