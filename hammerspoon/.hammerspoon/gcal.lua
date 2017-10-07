local Json = require("json")
require("table")
require("notify")

function loadTable(filename)
    local contents = ""
    local myTable = {}
    local file = io.open( cwd..filename, "r" )

    if file then
        -- read all contents of file into a string
        local contents = file:read( "*a" )
        myTable = Json.decode(contents);
        io.close( file )
        return myTable
    end
    return nil
end

local menu = hs.menubar.new()
local data = loadTable("events.json")
local num_events = #data['events']

function clickMenu(keys, event)
    print(inspect(event))
    print("clicked this! "..event['title'].." "..event['time'])
end

-- Refreshes events and sets menu to first event
function refreshMenu()
    notify("Google Calendar", "Refreshing events ... ", nil, nil)
    os.execute("/usr/local/bin/python3 /Users/kevzheng/dotfiles/hammerspoon/.hammerspoon/gcal.py -e")
    data = loadTable("events.json")
    num_events = #data['events']

    if menu then
        if num_events > 0 then
            menu:setTitle(data['events'][1]['time'].." - "..data['events'][1]['title'])
            
            local dropdown = {}
            dropdown[1] = {title = "Open Google Calendar ... ", fn=function() hs.urlevent.openURL("https://calendar.google.com") end}
            for k,v in pairs(data['events']) do
                dropdown[k+1] = {title = v['time'].." - "..v['title'], fn=clickMenu}
            end
            menu:setMenu(dropdown)
        else
           menu:setTitle("No events found!")
        end
    end 
end

-- First call initializes menu
refreshMenu()
timer = hs.timer.doEvery(1800, refreshMenu)

-- Sets menubar to first element

hs.hotkey.bind(hyper, "-", refreshMenu)