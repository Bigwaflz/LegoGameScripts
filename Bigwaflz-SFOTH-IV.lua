
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
misc:Seperator()
misc:Label("Fun Stuff")

misc:Button("Ball", function()
    local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local SPEED_MULTIPLIER = 30
local JUMP_POWER = 60
local JUMP_GAP = 0.3

local character = game.Players.LocalPlayer.Character

for i,v in ipairs(character:GetDescendants()) do
   if v:IsA("BasePart") then
       v.CanCollide = false
   end
end

local ball = character.HumanoidRootPart
ball.Shape = Enum.PartType.Ball
ball.Size = Vector3.new(5,5,5)
local humanoid = character:WaitForChild("Humanoid")
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Blacklist
params.FilterDescendantsInstances = {character}

local tc = RunService.RenderStepped:Connect(function(delta)
   ball.CanCollide = true
   humanoid.PlatformStand = true
if UserInputService:GetFocusedTextBox() then return end
if UserInputService:IsKeyDown("W") then
ball.RotVelocity -= Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
end
if UserInputService:IsKeyDown("A") then
ball.RotVelocity -= Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
end
if UserInputService:IsKeyDown("S") then
ball.RotVelocity += Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
end
if UserInputService:IsKeyDown("D") then
ball.RotVelocity += Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
end
--ball.RotVelocity = ball.RotVelocity - Vector3.new(0,ball.RotVelocity.Y/50,0)
end)

UserInputService.JumpRequest:Connect(function()
local result = workspace:Raycast(
ball.Position,
Vector3.new(
0,
-((ball.Size.Y/2)+JUMP_GAP),
0
),
params
)
if result then
ball.Velocity = ball.Velocity + Vector3.new(0,JUMP_POWER,0)
end
end)

Camera.CameraSubject = ball
humanoid.Died:Connect(function() tc:Disconnect() end)
end)
misc:Button("2012Animations", function()
    local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Char2 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local h = Char2:FindFirstChildOfClass("Humanoid") or Char2:WaitForChild("Humanoid")

if h.RigType ~= Enum.HumanoidRigType.R6 then return end

LocalPlayer.Character:BreakJoints()
LocalPlayer.Character=nil
repeat task.wait() until LocalPlayer.Character
Char = LocalPlayer.Character
task.wait(.1)
LocalPlayer.Character:BreakJoints()
       
LocalPlayer.CharacterAdded:Connect(function(c)
Char = c
function waitForChild(parent, childName)
local child = parent:FindFirstChild(childName)
if child then return child end
while true do
child = parent.ChildAdded:Wait()
if child.Name == childName then return child end
end
end

waitForChild(Char, "Animate").Disabled = true

task.wait(1)

-- ANIMATION

-- declarations

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Figure = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Torso = waitForChild(Figure, "Torso")
local RightShoulder = waitForChild(Torso, "Right Shoulder")
local LeftShoulder = waitForChild(Torso, "Left Shoulder")
local RightHip = waitForChild(Torso, "Right Hip")
local LeftHip = waitForChild(Torso, "Left Hip")
local Neck = waitForChild(Torso, "Neck")
local Humanoid = waitForChild(Figure, "Humanoid")
local pose = "Standing"

local toolAnim = "None"
local toolAnimTime = 0

local jumpMaxLimbVelocity = 0.75

-- functions

function onRunning(speed)
if speed>0 then
pose = "Running"
else
pose = "Standing"
end
end

function onDied()
pose = "Dead"
end

function onJumping()
pose = "Jumping"
end

function onClimbing()
pose = "Climbing"
end

function onGettingUp()
pose = "GettingUp"
end

function onFreeFall()
pose = "FreeFall"
end

function onFallingDown()
pose = "FallingDown"
end

function onSeated()
pose = "Seated"
end

function onPlatformStanding()
pose = "PlatformStanding"
end

function onSwimming(speed)
if speed>0 then
pose = "Running"
else
pose = "Standing"
end
end

function moveJump()
RightShoulder.MaxVelocity = jumpMaxLimbVelocity
LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
RightShoulder:SetDesiredAngle(3.14)
LeftShoulder:SetDesiredAngle(-3.14)
RightHip:SetDesiredAngle(0)
LeftHip:SetDesiredAngle(0)
end


-- same as jump for now

function moveFreeFall()
RightShoulder.MaxVelocity = jumpMaxLimbVelocity
LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
RightShoulder:SetDesiredAngle(3.14)
LeftShoulder:SetDesiredAngle(-3.14)
RightHip:SetDesiredAngle(0)
LeftHip:SetDesiredAngle(0)
end

function moveSit()
RightShoulder.MaxVelocity = 0.15
LeftShoulder.MaxVelocity = 0.15
RightShoulder:SetDesiredAngle(3.14 /2)
LeftShoulder:SetDesiredAngle(-3.14 /2)
RightHip:SetDesiredAngle(3.14 /2)
LeftHip:SetDesiredAngle(-3.14 /2)
end

function getTool()
for _, kid in ipairs(Figure:GetChildren()) do
if kid.className == "Tool" then return kid end
end
return nil
end

function getToolAnim(tool)
for _, c in ipairs(tool:GetChildren()) do
if c.Name == "toolanim" and c.className == "StringValue" then
return c
end
end
return nil
end

function animateTool()

if (toolAnim == "None") then
RightShoulder:SetDesiredAngle(1.57)
return
end

if (toolAnim == "Slash") then
RightShoulder.MaxVelocity = 0.5
RightShoulder:SetDesiredAngle(0)
return
end

if (toolAnim == "Lunge") then
RightShoulder.MaxVelocity = 0.5
LeftShoulder.MaxVelocity = 0.5
RightHip.MaxVelocity = 0.5
LeftHip.MaxVelocity = 0.5
RightShoulder:SetDesiredAngle(1.57)
LeftShoulder:SetDesiredAngle(1.0)
RightHip:SetDesiredAngle(1.57)
LeftHip:SetDesiredAngle(1.0)
return
end
end

function move(time)
local amplitude
local frequency

if (pose == "Jumping") then
moveJump()
return
end

if (pose == "FreeFall") then
moveFreeFall()
return
end

if (pose == "Seated") then
moveSit()
return
end

local climbFudge = 0

if (pose == "Running") then
if (RightShoulder.CurrentAngle > 1.5 or RightShoulder.CurrentAngle < -1.5) then
RightShoulder.MaxVelocity = jumpMaxLimbVelocity
else  
RightShoulder.MaxVelocity = 0.15
end
if (LeftShoulder.CurrentAngle > 1.5 or LeftShoulder.CurrentAngle < -1.5) then
LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
else  
LeftShoulder.MaxVelocity = 0.15
end
amplitude = 1
frequency = 9
elseif (pose == "Climbing") then
RightShoulder.MaxVelocity = 0.5
LeftShoulder.MaxVelocity = 0.5
amplitude = 1
frequency = 9
climbFudge = 3.14
else
amplitude = 0.1
frequency = 1
end

desiredAngle = amplitude * math.sin(time*frequency)

RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
RightHip:SetDesiredAngle(-desiredAngle)
LeftHip:SetDesiredAngle(-desiredAngle)


local tool = getTool()

if tool then

animStringValueObject = getToolAnim(tool)

if animStringValueObject then
toolAnim = animStringValueObject.Value
-- message recieved, delete StringValue
animStringValueObject.Parent = nil
toolAnimTime = time + .3
end

if time > toolAnimTime then
toolAnimTime = 0
toolAnim = "None"
end

animateTool()

else
toolAnim = "None"
toolAnimTime = 0
end
end


-- connect events

Humanoid.Died:Connect(onDied)
Humanoid.Running:Connect(onRunning)
Humanoid.Jumping:Connect(onJumping)
Humanoid.Climbing:Connect(onClimbing)
Humanoid.GettingUp:Connect(onGettingUp)
Humanoid.FreeFalling:Connect(onFreeFall)
Humanoid.FallingDown:Connect(onFallingDown)
Humanoid.Seated:Connect(onSeated)
Humanoid.PlatformStanding:Connect(onPlatformStanding)
Humanoid.Swimming:Connect(onSwimming)
-- main program

local runService = game:service("RunService");

while Figure.Parent~=nil do
local _, time = wait(0.1)
move(time)
end
end)
end)
misc:Button("DiveTool", function()
    local debounce=false
function _restoreproperties()
Holder = player.Character
Torso = Holder:FindFirstChild("Torso")
RightS = Torso:FindFirstChild("Right Shoulder")
LeftS = Torso:FindFirstChild("Left Shoulder")
RightH = Torso:FindFirstChild("Right Hip")
LeftH = Torso:FindFirstChild("Left Hip")
RightS.MaxVelocity = .15
LeftS.MaxVelocity = .15
RightH.MaxVelocity = .1
LeftH.MaxVelocity = .1
RightS.DesiredAngle = 0
LeftS.DesiredAngle = 0
LeftH.DesiredAngle = 0
RightH.DesiredAngle = 0
end
function ManageAnimation(value)
Holder = player.Character
Player = player
if value == "no anim" then
Anim = Holder:FindFirstChild("Animate")
if Anim~=nil then
Anim.Disabled = true
Anim.Parent = Player
end
elseif value == "re-anim" then
Anim = Player:FindFirstChild("Animate")
if Anim~=nil then
Anim.Disabled = false
Anim.Parent = Holder
end
end
end
function Down(ml)
for i=1, ml.velocity.y/3 do
ml.velocity = ml.velocity+Vector3.new(0,-4.25,0)
wait()
end
ml:Remove()
end
function Flip()
if debounce==true then return end
debounce=true
Char = player.Character
Human = Char.Humanoid
Torso = Char.Torso
CF = Torso.CFrame
local anim = Human:LoadAnimation(Char.Animate.fall:FindFirstChildOfClass("Animation"))

anim:Play()
Human.PlatformStand = true
VelUp = Instance.new("BodyVelocity")
VelUp.velocity = Vector3.new(0,45,0)+Torso.CFrame.lookVector*30 --Middle (0,0,0). Change for height.
VelUp.P = VelUp.P*2
VelUp.maxForce = Vector3.new(10000,10000,10000)*999
VelUp.Parent = Torso
coroutine.resume(coroutine.create(Down),VelUp)
Gyro = Instance.new("BodyGyro")
Gyro.P = Gyro.P*10
Gyro.maxTorque = Vector3.new(100000,100000,100000)*999
Gyro.cframe = CF
Gyro.Parent = Torso
for i=1, 3 do --The amount of time your guy flips.
Gyro.cframe = Gyro.cframe*CFrame.fromEulerAnglesXYZ(math.pi/-7,0,0) --The amount of flips. 1 = -16, 2 = -8
wait()
end
for i=1, 6 do --The amount of time your guy flips.
Gyro.cframe = Gyro.cframe*CFrame.fromEulerAnglesXYZ(math.pi/-40,0,0) --The amount of flips. 1 = -16, 2 = -8
wait()
end
wait(0.2)
for i=1, 10 do --The amount of time your guy flips.
Gyro.cframe = Gyro.cframe*CFrame.fromEulerAnglesXYZ(math.pi/-7,0,0) --The amount of flips. 1 = -16, 2 = -8
wait()
end
Gyro.cframe = CF
wait()
Gyro:Remove()
Human.PlatformStand = false
_restoreproperties()
debounce=false
end
function onActive(mouse)
player = game.Players.LocalPlayer
if player==nil then return end
mouse.Button1Down:connect(function() Flip() end)
end
local lol = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
lol.Name = "Dive Roll"
lol.Selected:connect(onActive)
end)


---NOTES---
local notes = serv:Channel("Notes")
notes:Label("Made by Bigwaflz#3281/Bigwaflz on github")
notes:Label("UI lib made by dawid#7205/dawid-scripts on github")
notes:Label("ESP script by recursion on V3rmillion")
notes:Label("Hitbox script made by Walidhook on V3rmillion")
notes:Label("Noclip script made by Denx on V3rmillion")
