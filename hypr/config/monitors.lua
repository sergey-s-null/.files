-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly

hl.monitor({
    output = MONITOR1,
    mode = "2560x1440@180Hz",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = MONITOR2,
    mode = "1920x1080@75Hz",
    position = "2560x0",
    scale = 1,
})

