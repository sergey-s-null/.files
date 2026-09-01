hl.bind("SUPER + Left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Down",  hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + Home",  hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + End",   hl.dsp.focus({ workspace = "m-1" }))

for id = 1, 10 do
    local key = id % 10
    hl.bind("SUPER + "..key, hl.dsp.focus({ workspace = "m~"..id }))
    hl.bind("SUPER + ALT + "..key, hl.dsp.focus({ workspace = id }))
end

hl.bind("SUPER + ALT + Down", hl.dsp.focus({ workspace = "emptym" }))
