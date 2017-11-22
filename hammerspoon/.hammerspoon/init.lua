hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}
hypertab = {"ctrl", "alt", "cmd", "tab"}


cwd = os.getenv("HOME") .. "/dotfiles/hammerspoon/.hammerspoon/"
-- ~/coding/personal/markov/markov

--require('watcher') -- Use when developing
inspect = require('inspect') -- Use for looking up tables
require('position')
require('timer')
require('focus')
require('spaces')
require('gcal/gcal')
require('monitor/monitor')

-- 
-- TODO: Configure spaces
spaces = require("hs._asm.undocumented.spaces")

-- To get names of applications
function getApps()
	hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:title()) end)
end
