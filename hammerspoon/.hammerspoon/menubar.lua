menu = hs.menubar.new()
shui_face = hs.image.imageFromPath('~/.hammerspoon/assets/shui.png')

hs.hotkey.bind(hyper, "R", function ()
  menu:setTitle('🏋 at 8:00am')
end)

-- eventName: open "hammerspoon://updateMenu?text=<text>"
function updateMenu (eventName, params)
	menu_text = params['text']
	n = 30
	if string.len(menu_text) > n then
		menu_text = menu_text:sub(0, n) .. "..."
	end
	menu:setTitle(menu_text)
end
hs.urlevent.bind("updateMenu", updateMenu)

hs.urlevent.bind("timer", menuTimer)

local function stopTimer()
	timer:stop()
	shui_notif = hs.notify.new({title="Shuiner Alarm",
								informativeText=meme})
	shui_notif:setIdImage(shui_face)
	shui_notif:soundName('alarm')
	shui_notif:send()
end

local function updateTimer()
	interval = interval - 1
	local min = interval // 60
	local sec = interval % 60
	local disp = string.format (" %02d:%02d ", min, sec)

	menu:setTitle(disp)
	print(disp)
	
	if interval == 0 then 
		stopTimer()
		menu:setTitle(nil)
	end
end

function menuTimer(eventName, params)
	interval = params['interval']
	print(interval)
	timer = hs.timer.new(1, updateTimer)
	timer:start()
end
hs.urlevent.bind('timer', menuTimer)
