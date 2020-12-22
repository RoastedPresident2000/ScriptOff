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
	local K = 1
	local g = Vector3.new(0, -workspace.Gravity/4,0)
	local x0 = MyHumanoidRootPart.CFrame * Vector3.new(0,2,-2)	
	local v0 = (MyMouse - x0 - 0.5*g*K*K)/K
	
	local nt = 0
	while (nt <K*2)and TouchedSnowball do
		SnowBall.CFrame = CFrame.new(0.5*g*nt*nt + v0*nt + x0)
		nt = nt + RunService.Heartbeat:Wait()
	end	
end)
