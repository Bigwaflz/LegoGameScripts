
local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Bigwaflz's SFOTH Hub")

local serv = win:Server("Main", "http://www.roblox.com/asset/?id=7037932063")

---TELEPORTS---
local tps = serv:Channel("Teleports")
tps:Button("Safezone", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 1)
end)
tps:Button("Armor", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 287, -121)
    wait(.5)
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16, 158, 230)
end)
tps:Button("Medkit", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93, 343, 101)
end)
tps:Button("TouchStone", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-214, 276, -66)
end)
tps:Button("Shadowsphere", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-204, 471, 267)
end)
tps:Button("Shieldsphere", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(151, 140, 208)
end)
local swords = serv:Channel("Swords")
swords:Button("Illumina", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-472, 390, 80.5)
end)
swords:Button("Ghostwalker", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(365.5, 20, 126.5)
end)
swords:Button("Darkheart", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-192.5, 62, 226.5)
end)
swords:Button("Venomshank", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(182.5, 222, 59.5)
end)
swords:Button("Windforce", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(84.5, 637, -290.5)
end)
swords:Button("Firebrand", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-230.5, 348, -144.7)
end)
swords:Button("IceDagger", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.5, 251, 339)
end)

  
---MISC/FUN---
local misc = serv:Channel("Misc/Fun")
misc:Slider("WalkSpeed", 16, 200, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)
misc:Slider("JumpPower", 16, 200, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)
misc:Button("ESP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fernandoagoncalves/universal-esp/main/esp.lua", true))()
end)
misc:Button("Infyield", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)
misc:Seperator()
misc:Label("Before using the hitbox turn on noclip")
misc:Label("To turn this off you need to rejoin")
misc:Button("Noclip", function()
---noclip---
local character = game.Players.LocalPlayer.Character
while true do
for i,v in pairs(character:GetDescendants()) do
pcall(function()
if v:IsA("BasePart") then
v.CanCollide = false
end
end)
end
task.wait()
end
end)
misc:Button("Hitbox/Loopkill", function()
---hitbox---
while wait() do
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(6000, 6000, 6000)
v.Character.HumanoidRootPart.Transparency = 1
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Gray")
v.Character.HumanoidRootPart.Material = "Plastic"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)


---NOTES---
local notes = serv:Channel("Notes")
notes:Label("Made by Bigwaflz#3281/Bigwaflz on github")
notes:Label("UI lib made by dawid#7205/dawid-scripts on github")
notes:Label("ESP script by recursion on V3rmillion")
notes:Label("Hitbox script made by Walidhook on V3rmillion")
notes:Label("Noclip script made by Denx on V3rmillion")
