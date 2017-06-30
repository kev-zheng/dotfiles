hyper = {"ctrl", "alt", "cmd", "shift"}
-- ~/coding/personal/markov/markov

require('watcher')
require('position')
require('timer')
require('focus')

-- TODO: Configure spaces
spaces = require("hs._asm.undocumented.spaces")

-- To get names of applications
function getApps()
	hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:title()) end)
end