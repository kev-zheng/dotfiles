hs.hotkey.bind(hyper, "C", function ()
  hs.application.launchOrFocus('Google Chrome')
end)

hs.hotkey.bind(hyper, 'E', function ()
  hs.application.launchOrFocus('Sublime Text')
end)

hs.hotkey.bind(hyper, "space", function ()
  hs.application.launchOrFocus('iTerm 2')
end)

hs.hotkey.bind(hyper, 'N', function()
  hs.application.launchOrFocus('Notes')
end)

hs.hotkey.bind(hyper, 'H', function()
  hs.application.launchOrFocus('Hammerspoon')
end)

hs.hotkey.bind(hyper, 'S', function ()
  hs.application.launchOrFocus('Spotify')
end)

hs.hotkey.bind(hyper, 'F', function ()
  hs.application.launchOrFocus('Finder')
end)

hs.hotkey.bind(hyper, 'M', function ()
  hs.application.launchOrFocus('Matlab_R2017a')
end)

hs.hotkey.bind(hyper, '-', function()
  print(hs.window:focusedWindow())
end)


