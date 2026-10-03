local keys = require("config.keys")
local monitors = require("config.monitors.list")

local monitors_submap = "monitors"

hl.bind("SUPER + " .. keys.M, hl.dsp.submap(monitors_submap))

hl.define_submap(monitors_submap, function()
    for i = 1, #monitors do
        local monitor = monitors[i]
        hl.bind(monitor.key, function()
            monitor:toggle()
        end)
    end

    hl.bind(keys.CATCH_ALL, function() end)
    hl.bind(keys.ESCAPE, hl.dsp.submap("reset"))
end)
