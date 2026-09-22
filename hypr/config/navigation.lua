local common = require("common")
local keys = require("config.keys")
local monitors = require("config.monitors").monitors

hl.bind("ALT + " .. keys.TAB, common.dsp.sendNoctaliaMessage("window-switcher"))

hl.bind("SUPER + " .. keys.LEFT, hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + " .. keys.RIGHT, hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + " .. keys.UP, hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + " .. keys.DOWN, hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + " .. keys.LEFT, hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + " .. keys.RIGHT, hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + " .. keys.UP, hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + " .. keys.DOWN, hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + " .. keys.HOME, hl.dsp.focus({ workspace = "m-1" }))
hl.bind("SUPER + " .. keys.END, hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + SHIFT + " .. keys.HOME, hl.dsp.window.move({ workspace = "m-1" }))
hl.bind("SUPER + SHIFT + " .. keys.END, hl.dsp.window.move({ workspace = "m+1" }))

hl.bind("SUPER + " .. keys.PAGE_UP, hl.dsp.focus({ monitor = monitors[1].name }))
hl.bind("SUPER + " .. keys.PAGE_DOWN, hl.dsp.focus({ monitor = monitors[2].name }))
hl.bind("SUPER + SHIFT + " .. keys.PAGE_UP, hl.dsp.window.move({ monitor = monitors[1].name }))
hl.bind("SUPER + SHIFT + " .. keys.PAGE_DOWN, hl.dsp.window.move({ monitor = monitors[2].name }))

hl.bind("SUPER + SHIFT + " .. keys.BRACKET_LEFT, hl.dsp.workspace.move({ monitor = monitors[1].name }))
hl.bind("SUPER + SHIFT + " .. keys.BRACKET_RIGHT, hl.dsp.workspace.move({ monitor = monitors[2].name }))

local keyToWorkspaceNumber = {
    { key = keys._1, num = "1" },
    { key = keys._2, num = "2" },
    { key = keys._3, num = "3" },
    { key = keys._4, num = "4" },
    { key = keys._5, num = "5" },
    { key = keys._6, num = "6" },
    { key = keys._7, num = "7" },
    { key = keys._8, num = "8" },
    { key = keys._9, num = "9" },
    { key = keys._0, num = "10" },
}

for _, x in pairs(keyToWorkspaceNumber) do
    hl.bind("SUPER + " .. x.key, hl.dsp.focus({ workspace = x.num }))
    hl.bind("SUPER + SHIFT + " .. x.key, hl.dsp.window.move({ workspace = x.num }))

    hl.bind("SUPER + ALT + " .. x.key, hl.dsp.focus({ workspace = "m~" .. x.num }))
    hl.bind("SUPER + SHIFT + ALT + " .. x.key, hl.dsp.window.move({ workspace = "m~" .. x.num }))
end

hl.bind("SUPER + ALT + " .. keys.DOWN, hl.dsp.focus({ workspace = "emptym" }))
hl.bind("SUPER + SHIFT + ALT + " .. keys.DOWN, hl.dsp.window.move({ workspace = "emptym" }))
