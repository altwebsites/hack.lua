local url = "https://raw.githubusercontent.com/altwebsites/hack.lua/main/main.lua" -- Put your copied link here

local success, result = pcall(function()
    return game:HttpGet(url)
end)


print("altwebsites script loaded successfully!")
else
    warn("HTTP Error: " .. tostring(result))
    print("Make sure your Repo is PUBLIC and the link is RAW.")
end
