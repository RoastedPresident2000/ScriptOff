--[[
	Scripted For The HD Script-off
	By Roastedpresident2000
	
	Christmas Countdown
]]

local RunService = game:GetService('RunService')
local CountText = script.Parent.Time
--//Manage Countdown Until Christmas
RunService.Heartbeat:Connect(function()
	local epoch = 1608786000
	local diff = epoch - os.time()
	local count = os.date("*t", diff)
	local FormattedCountDown = string.format("%02i", count.day)..":"..string.format("%02i", count.hour)..":"..string.format("%02i", count.min)..":"..string.format("%02i", count.sec)
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
