--[[

timer.lua

A simple timer that is displayed on the status bar,
triggered with a url event.

]]--

menu = hs.menubar.new()
icon = hs.image.imageFromPath('~/.hammerspoon/assets/shui.png')

local function stopTimer()
	timer:stop()
	notif = hs.notify.new({title="Shuiner Alarm",
								informativeText="Time's up!"})
	notif:setIdImage(icon)
	notif:soundName('alarm')
	notif:send()
end

local function updateTimer()
	time = time - 1
	local min = time // 60
	local sec = time % 60
	local disp = string.format (" %02d:%02d ", min, sec)

	menu:setTitle(disp)
	print(disp)
	
	if time == 0 then 
		stopTimer()
		menu:setTitle(nil)
	end
end

-- hammerspoon://timer?new=<True/False>&interval=<seconds>
function menuTimer(eventName, params)
	newTimer = params['new']
	interval = params['interval']

	-- Start a new timer when requested or when there is no timer
	if newTimer then
		-- Stop timer if one is already running
		if timer then
			timer:stop()
		end

		time = interval
		timer = hs.timer.new(1, updateTimer)
		timer:start()
	else
		-- Otherwise add additional time
		time = time + interval
	end
end
hs.urlevent.bind('timer', menuTimer)
