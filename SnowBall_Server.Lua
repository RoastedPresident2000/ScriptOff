local RemoteEvent = game:GetService('ReplicatedStorage').ThrowSnowball
local RunService = game:GetService('RunService')
local DebrisService = game:GetService('Debris')
local TouchedSnowball 

local function SnowDebris(SnowCFrame,SnowBall)
	--//Create the particles for snow debri????
	for i=1,4 do
		local DebriParticle = Instance.new('Part')
		DebriParticle.Name =  'SnowballDebris'
		DebriParticle.Shape = 'Ball'
		DebriParticle.Size = Vector3.new(math.random(1,8)/10,math.random(1,8)/10,math.random(1,8)/10)
		DebriParticle.CFrame = SnowCFrame	
		DebriParticle.Color = Color3.fromRGB(255,255,255)
		DebriParticle.Material = 'SmoothPlastic'
		DebriParticle.CanCollide = true
		DebriParticle.Anchored = false		
		DebriParticle.Parent = workspace
		DebrisService:AddItem(DebriParticle,5)
	end
end

RemoteEvent.OnServerEvent:Connect(function(plr,MyMouse)	
	--//Create the snow ball
	local MyCharacter = plr.Character
	local MyHumanoidRootPart = MyCharacter:WaitForChild('HumanoidRootPart')
	local MyThrowingHand = MyCharacter:FindFirstChild('RightHand')
	local SnowBall = Instance.new('Part')
	SnowBall.Name = 'SnowBall'
	SnowBall.Size = Vector3.new(0.8,0.8,0.8)
	SnowBall.Material = 'SmoothPlastic'
	SnowBall.Color = Color3.fromRGB(255,255,255)
	SnowBall.Anchored = true
	SnowBall.Shape = 'Ball'
	SnowBall.CanCollide = true
	SnowBall.Parent = workspace
	DebrisService:AddItem(SnowBall,3)
	--//Create Touched Function For the snow ball
	TouchedSnowball = SnowBall.Touched:Connect(function(hit)
		TouchedSnowball:Disconnect()
		SnowDebris(SnowBall.CFrame)
		
	end)	
	--// Snowball projectile calculation 
	local Kep = 1
	local GVector = Vector3.new(0, -workspace.Gravity/4,0)
	local Donald = MyHumanoidRootPart.CFrame * Vector3.new(0,2,-2)	
	local Obama = (MyMouse - Donald - 0.5*GVector*Kep*Kep)/Kep
	
	local PooTimer = 0
	while (PooTimer <Kep*2)and TouchedSnowball do
		SnowBall.CFrame = CFrame.new(0.5*GVector*PooTimer*PooTimer + Obama*PooTimer + Donald)
		PooTimer = PooTimer + RunService.Heartbeat:Wait()
	end	
end)
