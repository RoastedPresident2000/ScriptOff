--[[
	Scripted For The HD Script-off
	By Roastedpresident2000
	
	Christmas Countdown
]]

local RunService = game:GetService('RunService')
local CountText = script.Parent.Time
--//Manage Countdown Until Christmas
RunService.Heartbeat:Connect(function()
	local SecondsUntilChristmas = 1608786000
	local TimeDifference = SecondsUntilChristmas - os.time()
	local ClockedTime = os.date("*t", TimeDifference)
	--//Lets format the Time into the countdown string
	local FormattedCountDown = string.format("%02i", ClockedTime.day)..":"..string.format("%02i", ClockedTime.hour)..":"..string.format("%02i", ClockedTime.min)..":"..string.format("%02i", ClockedTime.sec)
	--//Update Text if ~= current timer
	if CountText.Text ~= FormattedCountDown then
		--// Is it christmas already or passed christmas?
		if diff <= 0 then
			CountText.Text = 'Merry Christmas!'
		else
			--// Not christmas? Display timer
			CountText.Text = FormattedCountDown
		end		
	end
end)
