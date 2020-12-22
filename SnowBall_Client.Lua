local RemoteEvent = game:GetService('ReplicatedStorage').ThrowSnowball
local Player = game:GetService('Players').LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local UserInputService = game:GetService('UserInputService')
local Mouse = Player:GetMouse()

poo = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.F then
			if poo then
				poo = false
				RemoteEvent:FireServer(Mouse.Hit.Position)
        --//Lets wait before we grab another snowball
				wait(4)
				poo = true
			end			
		end
	end
end)
