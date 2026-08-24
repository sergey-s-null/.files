
local maxSizeCoef = 0.5
local maxWidth = "(monitor_w * "..maxSizeCoef..")"
local maxHeight = "(monitor_h * "..maxSizeCoef..")"
local scaleCoef = "min(1, "..maxWidth.." / window_w, "..maxHeight.." / window_h)"
local actualWidth = "(window_w * "..scaleCoef..")"
local actualHeight = "(window_h * "..scaleCoef..")"

local leftOffset = 20
local rightOffset = 20
local topOffset = 50
local bottomOffset = 20

local left = "max("..leftOffset..", min(monitor_w - "..actualWidth.." - "..rightOffset..", cursor_x - "..actualWidth.." / 2))"
local top = "max("..topOffset..", min(monitor_h - "..actualHeight.." - "..bottomOffset..", cursor_y - "..actualHeight.." / 2))"

hl.window_rule({
    match = {
        class = "feh-pinned-screenshot",
    },
    opaque = true,
    float = true,
    pin = true,
    keep_aspect_ratio = true,
    rounding = 0,
    size = {
        actualWidth,
        actualHeight
    },
    move = {
        left,
        top
    },
})

hl.bind(
    "CTRL + SHIFT + Print",
    hl.dsp.exec_cmd(
        "grim"
        .. " -g \"$(slurp)\""
        .. " -"
        .. " |"
            .. " feh -"
            .. " --class feh-pinned-screenshot"
            .. " --scale-down"
            .. " --auto-zoom"
            .. " --no-menus"
    )
)
