-- NO CORE GUI - NO SPAM
if _G.VoidwareLoaded then return end
_G.VoidwareLoaded = true

local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Parent to PlayerGui to avoid permission errors
local sg = Instance.new("ScreenGui")
sg.Name = "VoidwareRemix"
sg.Parent = player:WaitForChild("PlayerGui")
sg.ResetOnSpawn = false

-- State Variables
local flying = false
local noclip = false

-- Main Window
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 260, 0, 280) -- Made taller for more buttons
main.Position = UDim2.new(0.5, -130, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = sg

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(120, 0, 255)
stroke.Thickness = 2

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 35)
topBar.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
topBar.Parent = main
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "VOIDWARE v3"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = topBar

-- Utility Button Creator
local function createButton(text, pos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 35)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Text = text
    btn.Font = Enum.Font.Gotham
    btn.Parent = main
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(function()
        callback(btn)
    end)
end

-- SPEED & JUMP INPUTS
local function createInput(placeholder, pos, callback)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0.85, 0, 0, 35)
    box.Position = pos
    box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.Parent = main
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
    box.FocusLost:Connect(function(enter) if enter then callback(box.Text) end end)
end

createInput("WalkSpeed...", UDim2.new(0.075, 0, 0.18, 0), function(v) 
    if player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.WalkSpeed = tonumber(v) or 16 end 
end)

createInput("JumpPower...", UDim2.new(0.075, 0
