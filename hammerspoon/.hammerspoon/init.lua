hyper = {"ctrl", "alt", "cmd"}

cwd = os.getenv("HOME") .. "/dotfiles/hammerspoon/.hammerspoon/"
-- ~/coding/personal/markov/markov

--require('watcher') -- Use when developing
require('position')
require('timer')
require('focus')
require('gcal')
inspect = require('inspect')
-- 
-- TODO: Configure spaces
spaces = require("hs._asm.undocumented.spaces")

-- To get names of applications
function getApps()
	hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:title()) end)
end