local keys = require("config.keys")
local dsp = require("config.screenshotting.dispatchers")

hl.bind("SUPER + " .. keys.PRINT, dsp.simple)
hl.bind("CONTROL + " .. keys.PRINT, dsp.simple)

hl.bind("SUPER + SHIFT + " .. keys.PRINT, dsp.modify_before_save)

hl.bind("CTRL + SHIFT + " .. keys.PRINT, dsp.pin)
hl.bind("SUPER + ALT + " .. keys.PRINT, dsp.pin)
