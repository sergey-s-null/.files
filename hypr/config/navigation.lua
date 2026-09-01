local monitors = require("config.monitors").monitors

hl.bind("SUPER + Left",          hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Right",         hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Up",            hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Down",          hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + Left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + Right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + Up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + Down",  hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + Home",         hl.dsp.focus({ workspace = "m-1" }))
hl.bind("SUPER + End",          hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + SHIFT + Home", hl.dsp.window.move({ workspace = "m-1" }))
hl.bind("SUPER + SHIFT + End",  hl.dsp.window.move({ workspace = "m+1" }))

hl.bind("SUPER + Page_Up",           hl.dsp.focus({ monitor = monitors[1].name }))
hl.bind("SUPER + Page_Down",         hl.dsp.focus({ monitor = monitors[2].name }))
hl.bind("SUPER + SHIFT + Page_Up",   hl.dsp.window.move({ monitor = monitors[1].name }))
hl.bind("SUPER + SHIFT + Page_Down", hl.dsp.window.move({ monitor = monitors[2].name }))

for id = 1, 10 do
    local key = id % 10

    hl.bind("SUPER + "..key,         hl.dsp.focus({ workspace = "m~"..id }))
    hl.bind("SUPER + SHIFT + "..key, hl.dsp.window.move({ workspace = "m~"..id }))

    hl.bind("SUPER + ALT + "..key,         hl.dsp.focus({ workspace = id }))
    hl.bind("SUPER + SHIFT + ALT + "..key, hl.dsp.window.move({ workspace = id }))
end

hl.bind("SUPER + ALT + Down", hl.dsp.focus({ workspace = "emptym" }))
hl.bind("SUPER + SHIFT + ALT + Down", hl.dsp.window.move({ workspace = "emptym" }))
