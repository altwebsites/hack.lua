-- Only run once
if _G.VoidwareLoaded then return end
_G.VoidwareLoaded = true

local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local sg = Instance.new("ScreenGui")
sg.Name = "VoidwareRemix"
sg.Parent = player:WaitForChild("PlayerGui")
sg.ResetOnSpawn = false

-- Main Window
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 260, 0, 200)
main.Position = UDim2.new(0.5, -130, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- Even darker
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = main

-- Neon Border/Glow effect
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(120, 0, 255)
stroke.Thickness = 2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = main

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 35)
topBar.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
topBar.BorderSizePixel = 0
topBar.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 10)
topCorner.Parent = topBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "VOIDWARE [BETA]"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.BackgroundTransparency =
