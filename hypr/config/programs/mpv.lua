local scale_w = 0.3
local width = "monitor_w * "..scale_w
local height = "window_h * ("..width..") / window_w"

local left = "monitor_w * 3 / 4 - ("..width..") / 2"
local top = "monitor_h * 3 / 4 - ("..height..") / 2"

hl.window_rule({
    match = {
        class = "mpv"
    },
    opaque = true,
    keep_aspect_ratio = true,
    float = true,
    size = {
        width,
        height
    },
    move = {
        left,
        top
    },
})
