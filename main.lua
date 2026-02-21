local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Create the UI
local sg = Instance.new("ScreenGui")
sg.Name = "SpeedControl"
sg.Parent = game.CoreGui
sg.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true -- So you can move it around
frame.Parent = sg

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 30)
label.Text = "Enter WalkSpeed:"
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0, 40)
textBox.Position = UDim2.new(0.1, 0, 0.4, 0)
textBox.PlaceholderText = "16"
textBox.Text = ""
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.Parent = frame

-- Handle the speed change
textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newSpeed = tonumber(textBox.Text)
        if newSpeed then
            humanoid.WalkSpeed = newSpeed
            print("Speed set to: " .. newSpeed)
        else
            textBox.Text = "Invalid Number"
        end
    end
end)
