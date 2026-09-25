-- Workspace rules wiki https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Add your workspace rules here. Increment the workspace number as you go. Do not have duplicate workspaces.

local common = require("common")
local monitors = require("config.monitors.list")
local keys = require("config.keys")

local browser = "browser"

hl.bind("SUPER + " .. keys.B, hl.dsp.focus({ workspace = "name:" .. browser }))
hl.bind("SUPER + SHIFT + " .. keys.B, hl.dsp.window.move({ workspace = "name:" .. browser }))

hl.workspace_rule({
    workspace = "name:browser",
    on_created_empty = common.dspstr.launch("vivaldi"),
})

hl.workspace_rule({
    workspace = "name:gg",
    monitor = monitors[1].name,
})
hl.workspace_rule({
    workspace = "1",
    monitor = monitors[1].name,
    default = true,
    persistent = true,
})
hl.workspace_rule({
    workspace = "99",
    monitor = monitors[2].name,
    default = true,
})
