local keys = require("config.keys")

local tools_submap = "tools"

hl.bind("SUPER + " .. keys.H, hl.dsp.submap(tools_submap))

hl.define_submap(tools_submap, "reset", function()
    hl.bind(keys.P, hl.dsp.exec_cmd("hyprpicker -a -n"))

    hl.bind(keys.CATCH_ALL, function() end)
    hl.bind(keys.ESCAPE, hl.dsp.submap("reset"))
end)
