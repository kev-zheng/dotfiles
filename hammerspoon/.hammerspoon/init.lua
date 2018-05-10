-- Globals
hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}
hypertab = {"ctrl", "alt", "cmd", "tab"}

-- Used GNU Stow to manage my dotfiles into one directory
cwd = os.getenv("HOME") .. "/dotfiles/hammerspoon/.hammerspoon/"

inspect = require('inspect') -- Use for looking up tables
require('position')
require('focus')
require('gcal')
require('monitor/monitor')
require('notify')
require('spaces')
require('timer')

-- Developer tools

--require('watcher') -- Use when developing
--To get names of applications
function getApps()
	hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:title()) end)
end
