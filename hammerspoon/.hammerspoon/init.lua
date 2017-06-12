hyper = {"ctrl", "alt", "cmd"}
meme = "Time's up! Ａｅｓｔｈｅｔｉｃ バス ｓｈｉｔ バスツアー Ａｅｓｔｈｅｔｉｃ ｓｈｉｔ スツ ｔｈａｔｓ モール ｓｏｍｅ Ａｅｓｔｈｅｔｉｃ バス ｔｈａｔｓ モール ｓｏｍｅ Ａｅｓｔｈｅｔｉｃ バス ｓｈｉｔ ｒｉｇｈｔ ｔｈｅｒｅ)"

require('watcher')
require('position')
require('menubar')
require('focus')

-- Spaces module

spaces = require("hs._asm.undocumented.spaces")

-- To get names of applications
function getApps()
	hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:title()) end)
end