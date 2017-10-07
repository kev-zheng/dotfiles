function notify(title, info, image, sound)
	local notif = hs.notify.new({title=title, informativeText=info})
    
    if image then
        notif:setIdImage(image)
    end

	if sound then
		notif:soundName('alarm')
	end 

	notif:send()
end