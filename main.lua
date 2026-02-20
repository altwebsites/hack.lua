-- Simple Test Script for altwebsites
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
TextLabel.Parent = ScreenGui
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Position = UDim2.new(0.5, -100, 0, 50)
TextLabel.Text = "GitHub Script Loaded Successfully!"
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

print("altwebsites script is now running!")
wait(5)
ScreenGui:Destroy()
