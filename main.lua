-- ANTI-SPAM & WAIT
repeat task.wait() until game:IsLoaded()
if _G.VoidwareLoaded then return end
_G.VoidwareLoaded = true

local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local userInput = game:GetService("UserInputService")

-- UI SETUP (Using PlayerGui to ghost CoreGui)
local sg = Instance.new("ScreenGui", player.PlayerGui)
sg.Name = "Voidware_Final"
sg.ResetOnSpawn = false

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 260, 0, 320)
main.Position = UDim2.new(0.5, -130, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.Draggable = true
main.Active = true

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(120, 0, 255)
stroke.Thickness = 2

-- LOGIC STATES
local noclip = false
local espEnabled = false

-- NOCLIP LOOP
runService.Stepped:Connect(function()
    if noclip and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- ESP FUNCTION
local function applyESP()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character then
            local h = p.Character:FindFirstChild("VoidESP") or Instance.new("Highlight", p.Character)
            h.Name = "VoidESP"
            h.FillColor = Color3.fromRGB(120, 0, 255)
            h.Enabled = espEnabled
        end
    end
end

-- UI ELEMENTS
local function btn(txt, pos, cb)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.Position = pos
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = txt
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() cb(b) end)
end

btn("Toggle NoClip", UDim2.new(0.05, 0, 0.45, 0), function(b)
    noclip = not noclip
    b.Text = noclip and "NoClip: ON" or "NoClip: OFF"
end)

btn("Toggle ESP", UDim2.new(0.05, 0, 0.60, 0), function
