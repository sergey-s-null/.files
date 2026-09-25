local function build_position_config(width_scale, left_rel, top_rel)
    local width = "monitor_w * " .. width_scale
    local height = "window_h * (" .. width .. ") / window_w"
    local left = "monitor_w * " .. left_rel .. " - (" .. width .. ") / 2"
    local top = "monitor_h * " .. top_rel .. " - (" .. height .. ") / 2"
    return { width = width, height = height, left = left, top = top, }
end

local default_position = build_position_config(0.3, 0.25, 0.75)
local tracked_position = build_position_config(0.3, 0.75, 0.75)

hl.window_rule({
    match = {
        class = "mpv(|\\W.*)",
    },
    opaque = true,
    keep_aspect_ratio = true,
    float = true,
})

hl.window_rule({
    match = {
        class = "mpv",
    },
    size = {
        default_position.width,
        default_position.height
    },
    move = {
        default_position.left,
        default_position.top
    },
})

hl.window_rule({
    match = {
        class = "mpv-tracked",
    },
    size = {
        tracked_position.width,
        tracked_position.height
    },
    move = {
        tracked_position.left,
        tracked_position.top
    },
})
