require("config.tools.translation.window_rules.configure")

local keys = require("config.keys")
local ocr_dsp = require("config.tools.ocr.dispatchers")

local tools_submap = "tools"
local ocr_submap = tools_submap .. "/ocr"

hl.bind("SUPER + " .. keys.H, hl.dsp.submap(tools_submap))

hl.define_submap(tools_submap, "reset", function()
    hl.bind(keys.T, hl.dsp.exec_cmd("~/.config/fish/scripts/translate_kitty.fish"))
    hl.bind(keys.P, hl.dsp.exec_cmd("hyprpicker -a -n"))

    hl.bind(keys.O, ocr_dsp.exec_any_lang())
    hl.bind("SUPER + " .. keys.O, hl.dsp.submap(ocr_submap))

    hl.bind(keys.CATCH_ALL, function() end)
    hl.bind(keys.ESCAPE, hl.dsp.submap("reset"))
end)

hl.define_submap(ocr_submap, "reset", function()
    hl.bind(keys.E, ocr_dsp.exec_eng())
    hl.bind(keys.R, ocr_dsp.exec_rus())

    hl.bind(keys.CATCH_ALL, function() end)
    hl.bind(keys.ESCAPE, hl.dsp.submap("reset"))
end)
