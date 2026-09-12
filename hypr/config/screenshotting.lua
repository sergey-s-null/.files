local common = require("common")
local keys = require("config.keys")

local maxSizeCoef = 0.5
local maxWidth = "(monitor_w * " .. maxSizeCoef .. ")"
local maxHeight = "(monitor_h * " .. maxSizeCoef .. ")"
local scaleCoef = "min(1, " .. maxWidth .. " / window_w, " .. maxHeight .. " / window_h)"
local actualWidth = "(window_w * " .. scaleCoef .. ")"
local actualHeight = "(window_h * " .. scaleCoef .. ")"

local leftOffset = 20
local rightOffset = 20
local topOffset = 50
local bottomOffset = 20

local left = "max("
    .. leftOffset .. ", "
    .. "min(monitor_w - " .. actualWidth .. " - " .. rightOffset .. ", cursor_x - " .. actualWidth .. " / 2))"
local top = "max("
    .. topOffset .. ", "
    .. "min(monitor_h - " .. actualHeight .. " - " .. bottomOffset .. ", cursor_y - " .. actualHeight .. " / 2))"

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

local screenshotsDirectory = "$HOME/Pictures/scr/$(date +%Y)/$(date +%m)/"
local fileNameFormat = "%d_%H-%M-%S_%3N.png"

hl.bind(
    "SUPER + " .. keys.PRINT,
    hl.dsp.exec_cmd(
        "geometry=$(slurp)"
        .. " && scrdir=" .. screenshotsDirectory
        .. " && mkdir -p $scrdir"
        .. " && grim -g \"$geometry\" - | tee $scrdir/$(date +" .. fileNameFormat .. ") | wl-copy"
    )
)

hl.bind(
    "SUPER + SHIFT + " .. keys.PRINT,
    hl.dsp.exec_cmd(
        "geometry=$(slurp)"
        .. " && scrdir=" .. screenshotsDirectory
        .. " && filepath=$scrdir/$(date +" .. fileNameFormat .. ")"
        .. " && mkdir -p $scrdir"
        .. " && grim -g \"$geometry\" - | satty --filename - --output-filename $filepath"
        .. " && [ -f $filepath ] && wl-copy < \"$filepath\""
    )
)

local pinScreenshotDispatcher = hl.dsp.exec_cmd(
    "geometry=$(slurp)"
    .. " && grim -g \"$geometry\" - | feh - --class feh-pinned-screenshot --scale-down --auto-zoom --no-menus"
)
hl.bind("CTRL + SHIFT + " .. keys.PRINT, pinScreenshotDispatcher)
hl.bind("SUPER + ALT + " .. keys.PRINT, pinScreenshotDispatcher)
