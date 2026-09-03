hl.bind("SUPER + B", hl.dsp.workspace.toggle_special("browser"))

hl.workspace_rule({
    workspace = "special:browser",
    on_created_empty = "vivaldi",
    gaps_out = 40,
})
