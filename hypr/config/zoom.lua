local MIN_ZOOM = 1.0
local MAX_ZOOM = 5.0

local function changeZoom(multiplier)
    local factor = hl.get_config("cursor:zoom_factor")
    
    factor = factor * multiplier
    factor = math.max(MIN_ZOOM, factor)
    factor = math.min(MAX_ZOOM, factor)

    hl.config({ cursor = { zoom_factor = factor } })
end

hl.bind("SUPER + Equal", function() changeZoom(1.5) end, { repeating = true })
hl.bind("SUPER + Minus", function() changeZoom(1.0 / 1.5) end, { repeating = true})
