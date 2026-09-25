local keys = require("config.keys")

hl.config({
    cursor = {
        zoom_disable_aa = true,
        -- zoom_detached_camera = false,
        -- zoom_rigid = true,
    }
})

local MIN_ZOOM = 1.0
local MAX_ZOOM = 5.0

local function change_zoom(multiplier)
    local factor = hl.get_config("cursor:zoom_factor")

    factor = factor * multiplier
    factor = math.max(MIN_ZOOM, factor)
    factor = math.min(MAX_ZOOM, factor)

    hl.config({ cursor = { zoom_factor = factor } })
end

hl.bind("SUPER + " .. keys.EQUAL, function() change_zoom(1.5) end, { repeating = true })
hl.bind("SUPER + " .. keys.MINUS, function() change_zoom(1.0 / 1.5) end, { repeating = true })
