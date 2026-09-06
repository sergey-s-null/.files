hl.bind("SUPER + B", hl.dsp.workspace.toggle_special("browser"))
hl.bind("SUPER + C", hl.dsp.workspace.toggle_special("calc"))
hl.bind("SUPER + U", hl.dsp.workspace.toggle_special("music"))

hl.workspace_rule({
    workspace = "special:browser",
    on_created_empty = "vivaldi",
    gaps_out = 40,
})

hl.workspace_rule({
    workspace = "special:calc",
    on_created_empty = "kitty -e ipython",
    gaps_out = 40,
})

hl.workspace_rule({
    workspace = "special:music",
    on_created_empty = "kitty -e rmpc",
    gaps_out = 40,
})
