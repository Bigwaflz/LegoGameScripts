
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

  
---MISC---
local misc = serv:Channel("Misc")
misc:Slider("WalkSpeed", 16, 200, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)
misc:Slider("JumpPower", 16, 200, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)
misc:Button("ESP", function()
    _G.Configuration = {
   Tracers = true,
   PlayerInfo = true,
   Outlines = true,
   ShowAllyTeam = true,
   UseTeamColor = true
}

local Camera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")

local Players = game:GetService("Players")
local LocalPlayer = game:GetService("Players").LocalPlayer
local DrawedPlayers = {}

local Vector2 = Vector2.new
local RGB = Color3.fromRGB

local function CreateDrawing(object, properties)
   local Object = Drawing.new(object)

   for i, v in pairs(properties) do
       Object[i] = v
   end
   
   return Object
end

local function AddVisuals(player)
   if DrawedPlayers[player.Name] then return end

   DrawedPlayers[player.Name] = {
       Player = player,
       Info = CreateDrawing("Text", {Text = "", Center = true, Outline = true, Size = 16, Transparency = 1, Position = Vector2(0, 0), Color = RGB(255, 255, 255), Visible = false}),
       TracerOutline = CreateDrawing("Line", {Transparency = 1, Thickness = 1.5, From = Vector2(0, 0), To = Vector2(0, 0), Color = RGB(0, 0, 0), Visible = false}),
       Tracer = CreateDrawing("Line", {Transparency = 1, Thickness = 1.5, From = Vector2(0, 0), To = Vector2(0, 0), Color = RGB(255, 255, 255), Visible = false}),
   }
end

local function IsOnTeam(player)
   if LocalPlayer.TeamColor.Color == player.TeamColor.Color then
       return true
   else
       return false
   end
end

local function SetVisuals(table, type, value) --// ugh this is so bad, stupid outlines
   if type == "Color" then
       table.Tracer.Color = value
   elseif type == "Visibility" then
       for i, v in pairs(table) do
           if tostring(i) ~= "Player" then
               v.Visible = value
           end
       end
   end
end

for i, v in pairs(Players:GetPlayers()) do
   if v ~= LocalPlayer then
       AddVisuals(v)
   end
end

Players.PlayerAdded:Connect(function(player)
   AddVisuals(player)
end)

Players.PlayerRemoving:Connect(function(player)
   for i, v in pairs(DrawedPlayers[player.Name]) do
       wait()
       v:Remove()
   end

   wait()
   DrawedPlayers[player.Name] = nil
end)

RunService:BindToRenderStep("Universal", 500, function()
   for i, v in pairs(Players:GetPlayers()) do
       if v ~= LocalPlayer then
           local Player = v
           local DrawedPlayer = DrawedPlayers[Player.Name]

           if DrawedPlayer then
               local Drawings = {
                   Info = DrawedPlayer.Info,
                   Tracer = DrawedPlayer.Tracer,
                   TracerOutline = DrawedPlayer.TracerOutline,
               }
               
               if Player then
                   local LocalCharacter = LocalPlayer.Character
                   local Character = Player.Character

                   if LocalCharacter and Character then
                       local LocalPlayerHumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
                       local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

                       if LocalPlayerHumanoidRootPart and HumanoidRootPart then
                           local HumanoidRootPartPosition, PlayerOnScreen = Camera:WorldToViewportPoint(HumanoidRootPart.Position)

                           Drawings.Info.Text = Player.Name
                           Drawings.Info.Position = Vector2(HumanoidRootPartPosition.X, (HumanoidRootPartPosition.Y - (6000 / HumanoidRootPartPosition.Z) / 2) - 20)
                           Drawings.Info.Outline = _G.Configuration.Outlines

                           Drawings.Tracer.From = Vector2(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                           Drawings.Tracer.To = Vector2(HumanoidRootPartPosition.X, HumanoidRootPartPosition.Y)
                           
                           Drawings.TracerOutline.Thickness = (Drawings.Tracer.Thickness * 2)
                           Drawings.TracerOutline.From = Drawings.Tracer.From
                           Drawings.TracerOutline.To = Drawings.Tracer.To
                           

                           if _G.Configuration.UseTeamColor then
                               SetVisuals(Drawings, "Color", Player.TeamColor.Color)
                           else
                               SetVisuals(Drawings, "Color", RGB(255, 255, 255))
                           end

                           Drawings.Info.Visible = _G.Configuration.PlayerInfo
                           Drawings.Tracer.Visible = _G.Configuration.Tracers
                           Drawings.TracerOutline.Visible = _G.Configuration.Outlines

                           if _G.Configuration.ShowAllyTeam then
                               SetVisuals(Drawings, "Visibility", true)
                           else
                               if IsOnTeam(Player) then
                                   SetVisuals(Drawings, "Visibility", false)
                               else
                                   SetVisuals(Drawings, "Visibility", true)
                               end
                           end
                           
                           if not PlayerOnScreen then
                               SetVisuals(Drawings, "Visibility", false)
                           end
                       else
                           SetVisuals(Drawings, "Visibility", false)
                       end
                   else
                       SetVisuals(Drawings, "Visibility", false)
                   end
               else
                   SetVisuals(Drawings, "Visibility", false)
               end
           end
       end
   end
end)
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
notes:Seperator()
notes:Label("ESP script by coasts on V3rmillion")
notes:Label("Hitbox script made by Walidhook on V3rmillion")
notes:Label("Noclip script made by Denx on V3rmillion")
