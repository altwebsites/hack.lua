-- SAFETY CHECK: Wait for the game to actually exist
repeat task.wait() until game:IsLoaded()
local player = game.Players.LocalPlayer
repeat task.wait() until player:WaitForChild("PlayerGui")

-- PREVENT MULTI-LOAD SPAM
if _G.VoidwareLoaded then return end
_G.VoidwareLoaded = true

-- UI SETUP (Using PlayerGui to bypass the CoreGui bitch-fit)
local sg = Instance.new("ScreenGui")
sg.Name = "Voidware_Safe"
sg.Parent = player.PlayerGui -- THE FIX IS HERE
sg.ResetOnSpawn = false

-- THE MAIN FRAME
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 260, 0, 320)
main.Position = UDim2.new(0.5, -130, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.Active = true
main.Draggable = true
main.Parent = sg

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(120, 0, 255)
stroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
title.Text = "VOIDWARE V4 [ANTI-COREGUI]"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.Parent = main
Instance.new("UICorner", title)

-- FLY & NOCLIP LOGIC
local noclip = false
game:GetService("RunService").Stepped:Connect(function()
    if noclip and player.Character then
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- BUTTON CREATOR
local function btn(txt, pos, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.Position = pos
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = txt
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.Gotham
    b.Parent = main
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() cb(b) end)
end

-- SPEED & JUMP INPUTS (Enter to apply)
local function input(ph, pos, cb)
    local i = Instance.new("TextBox")
    i.Size = UDim2.new(0.9, 0, 0, 35)
    i.Position = pos
    i.PlaceholderText = ph
    i.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    i.TextColor3 = Color3.new(1, 1, 1)
    i.Parent = main
    i.FocusLost:Connect(function(e) if e then cb(i.Text) end end)
end

input("Set WalkSpeed", UDim2.new(0.05, 0, 0.15, 0), function(v) player.Character.Humanoid.WalkSpeed = tonumber(v) end)
input("Set JumpPower", UDim2.new(0.05, 0, 0.30, 0), function(v) player.Character.Humanoid.JumpPower = tonumber(v) player.Character.Humanoid.UseJumpPower = true end)

btn("Toggle NoClip: OFF", UDim2.new(0.05, 0, 0.45, 0), function(b)
    noclip = not noclip
    b.Text = noclip and "NoClip: ON" or "NoClip: OFF"
    b.TextColor3 = noclip and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
end)

btn("Toggle ESP: OFF", UDim2.new(0.05, 0, 0.60, 0), function(b)
    _G.ESP = not _G.ESP
    b.Text = _G.ESP and "ESP: ON" or "ESP: OFF"
    -- ESP Logic would go here
end)

-- HIDE KEY (RightShift)
game:GetService("UserInputService").InputBegan:Connect(function(k, g)
    if not g and k.KeyCode == Enum.KeyCode.RightShift then main.Visible = not main.Visible end
end)
