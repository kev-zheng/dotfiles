--[[

timer.lua

A simple timer that is displayed on the status bar,
triggered with a url event.

]]--

require("notify")

notif_title = "Shuiner Alarm"
shui_icon = hs.image.imageFromPath('~/.hammerspoon/assets/shui.png')

menu = hs.menubar.new()
pomodoro = false
rest = false

 quote = "You can\'t stop the waves, but you can learn to surf."
 words = {}

for w in quote:gmatch("%S+") do
	table.insert(words, w)
end

local function toggleRest()
	if rest == true then -- Currently taking a break, go back
		time = 25 * 60
		rest = false
		notify(notif_title, "Get to work!", shui_icon, true)
	else
		time = 5 * 60
		notify(notif_title, "Take a break!", shui_icon, nil)
		rest = true
	end
end

local function updateTimer()
	time = time - 1
	local min = time // 60
	local sec = time % 60
	local disp = string.format (" %02d:%02d ", min, sec)
	disp = message .. disp

	menu:setTitle(disp)
	print(disp)
	
	if time == 0 then
		if pomodoro == true then
			toggleRest()
		else
			timer:stop()
			notify(notif_title, "Time's up!", shui_icon, true)
			menu:setTitle(nil)
		end
	end
end

-- URL EVENT: hammerspoon://timer?arg={}&message={}
-- arguments: pomodoro, pause, resume, or {interval (s)}
-- optional message to be displayed at top of status bar
function menuTimer(eventName, params)
	arg = params['arg']
	message = params['message']
	if arg == 'pomodoro' then
		if timer then
			timer:stop()
		end
		pomodoro = true 
		time = 25 * 60
		timer = hs.timer.new(1, updateTimer)
		timer:start()
	elseif arg == 'pause' and timer then
		timer:stop()
	elseif arg == 'resume' and timer then
		timer:start()
	else
		if timer then
			timer:stop()
		end
		pomodoro = false
		time = arg
		timer = hs.timer.new(1, updateTimer)
		timer:start()
	end
end
hs.urlevent.bind('timer', menuTimer)
