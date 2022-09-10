-- Toggles
getgenv().aw = false
getgenv().autow = false
getgenv().autobhop = false
-- Locals
local ws = 16
local jp = 50
local rs = game:GetService("RunService")
-- Kavo-UI-Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Rat Washing Tycoon - v1.01", "Synapse")
-- [Tabs] - Main/LocalPlayer/Toggles/Misc/Etc
local M = Window:NewTab("Autofarm")
local M1 = M:NewSection("Autofarm")
local M2 = M:NewSection("LocalPlayer")
M1:NewButton("Complete Obby [Boost]", "Completing the Obby gives a scrubbing boost", function()
    for i,v in pairs(game:GetService("Workspace").Obby.Button.Hitbox:GetDescendants()) do
        if v:IsA("TouchTransmitter") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            wait(0.1)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end)
M1:NewToggle("Auto Collect Rats", "Collects Rats like you :))", function(bitch)
    getgenv().aw = bitch
    if not getgenv().aw then return end
end)
M1:NewToggle("Auto Sell Rats", "Sells rats, includes you too", function(nun)
    getgenv().autow = nun
    if not getgenv().autow then return end
end)
M2:NewSlider("WalkSpeed", "Sets your WalkSpeed", 120,16, function(no)
    ws = no
end)
M2:NewSlider("JumpPower", "Sets your JumpPower", 500,50, function(yes)
    jp = yes
end)
rs.RenderStepped:Connect(function()
    if getgenv().aw == true then
        for i,v in pairs(game:GetService("Workspace").Tycoons.Tycoon.Rats:GetChildren()) do
            for i,puto in pairs(v:GetChildren()) do
                if puto.Name == "Union" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = puto.CFrame
                end
            end
        end
    end
end)
rs.RenderStepped:Connect(function()
    if getgenv().autow == true then
        game:GetService("ReplicatedStorage").Knit.Services.TycoonService.RE.SellRats:FireServer()
    end
end)
rs.RenderStepped:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ws
end)
rs.RenderStepped:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jp
end)