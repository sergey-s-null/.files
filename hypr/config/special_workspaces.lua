local common = require("common")

local browser = "browser"
local calculator = "calc"
local music = "music"
local knowledge = "knowledge"

hl.bind("SUPER + B", hl.dsp.workspace.toggle_special(browser))
hl.bind("SUPER + C", hl.dsp.workspace.toggle_special(calculator))
hl.bind("SUPER + U", hl.dsp.workspace.toggle_special(music))
hl.bind("SUPER + K", hl.dsp.workspace.toggle_special(knowledge))

hl.workspace_rule({
    workspace = "special:"..browser,
    on_created_empty = common.dspstr.launch("vivaldi"),
    gaps_out = {
        left = 8,
        right = 8,
        top = 8,
        bottom = 40,
    },
})

hl.workspace_rule({
    workspace = "special:"..calculator,
    on_created_empty = common.dspstr.launch("kitty -e ipython"),
    gaps_out = 40,
})

hl.workspace_rule({
    workspace = "special:"..music,
    on_created_empty = common.dspstr.launch("kitty -e rmpc"),
    gaps_out = 40,
})

hl.workspace_rule({
    workspace = "special:"..knowledge,
    on_created_empty = common.dspstr.launch("obsidian vault=\"Main Storage\""),
    gaps_out = 40,
})
