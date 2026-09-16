local common = require("common")
local keys = require("config.keys")

local browser = "browser"
local calculator = "calc"
local music = "music"
local knowledge = "knowledge"
local secrets = "secrets"

local ws_keys = {
    {
        name = browser,
        key = keys.B,
    },
    {
        name = calculator,
        key = keys.C,
    },
    {
        name = music,
        key = keys.U,
    },
    {
        name = knowledge,
        key = keys.K,
    },
    {
        name = secrets,
        key = keys.P,
    },
}

for _, x in pairs(ws_keys) do
    hl.bind("SUPER + " .. x.key, hl.dsp.workspace.toggle_special(x.name))
    hl.bind("SUPER + SHIFT + " .. x.key, hl.dsp.window.move({ workspace = "special:" .. x.name }))
end

hl.workspace_rule({
    workspace = "special:" .. browser,
    on_created_empty = common.dspstr.launch("vivaldi"),
    gaps_out = {
        left = 8,
        right = 8,
        top = 8,
        bottom = 40,
    },
})

hl.workspace_rule({
    workspace = "special:" .. calculator,
    on_created_empty = common.dspstr.launch("kitty -e ipython"),
    gaps_out = 40,
})

hl.workspace_rule({
    workspace = "special:" .. music,
    on_created_empty = common.dspstr.launch("kitty -e rmpc"),
    gaps_out = 40,
})

hl.workspace_rule({
    workspace = "special:" .. knowledge,
    on_created_empty = common.dspstr.launch("obsidian vault=\"Main Storage\""),
    gaps_out = 40,
})

hl.workspace_rule({
    workspace = "special:" .. secrets,
    on_created_empty = common.dspstr.launch("keepassxc"),
    gaps_out = 80,
})
