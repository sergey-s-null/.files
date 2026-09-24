local keys = require("config.keys")

local tools_submap = "tools"
local ocr_submap = tools_submap .. "/ocr"

hl.bind("SUPER + " .. keys.H, hl.dsp.submap(tools_submap))

hl.define_submap(tools_submap, "reset", function()
    hl.bind(keys.P, hl.dsp.exec_cmd("hyprpicker -a -n"))

    hl.bind(keys.O, hl.dsp.exec_cmd(
        "geometry=$(slurp)"
        .. " && grim -g \"$geometry\" - | tesseract - - | wl-copy"
    ))
    hl.bind("SUPER + " .. keys.O, hl.dsp.submap(ocr_submap))

    hl.bind(keys.CATCH_ALL, function() end)
    hl.bind(keys.ESCAPE, hl.dsp.submap("reset"))
end)

hl.define_submap(ocr_submap, "reset", function()
    hl.bind(keys.E, hl.dsp.exec_cmd(
        "geometry=$(slurp)"
        .. " && grim -g \"$geometry\" - | tesseract - - -l eng | wl-copy"
    ))
    hl.bind(keys.R, hl.dsp.exec_cmd(
        "geometry=$(slurp)"
        .. " && grim -g \"$geometry\" - | tesseract - - -l rus | wl-copy"
    ))

    hl.bind(keys.CATCH_ALL, function() end)
    hl.bind(keys.ESCAPE, hl.dsp.submap("reset"))
end)
