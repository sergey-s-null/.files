local function build_geometry()
    local width = 500
    local height = 300
    local right_margin = 80
    local bottom_offset = 80
    local left = "monitor_w - " .. width .. " - " .. right_margin
    local top = "monitor_h - " .. height .. " - " .. bottom_offset
    return { width = width, height = height, left = left, top = top, }
end

local geometry = build_geometry()

hl.window_rule({
    match = {
        class = "kitty-translation",
    },
    no_anim = true,
    float = true,
    size = {
        geometry.width,
        geometry.height
    },
    move = {
        geometry.left,
        geometry.top
    },
})