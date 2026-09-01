-- Workspace rules wiki https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Add your workspace rules here. Increment the workspace number as you go. Do not have duplicate workspaces.

local monitors = require("config.monitors").monitors

hl.workspace_rule({
    workspace = "1",
    monitor = monitors[1].name,
    default = true,
    persistent = true,
})
hl.workspace_rule({
    workspace = "name:gaming",
    monitor = monitors[1].name,
})
hl.workspace_rule({
    workspace = "99",
    monitor = monitors[2].name,
    default = true,
})
