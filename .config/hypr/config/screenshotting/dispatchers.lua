local screenshotsDirectory = "$HOME/Pictures/scr/$(date +%Y)/$(date +%m)/"
local fileNameFormat = "%d_%H-%M-%S_%3N.png"

return {
    simple = hl.dsp.exec_cmd(
        "geometry=$(slurp)"
        .. " && scrdir=" .. screenshotsDirectory
        .. " && mkdir -p $scrdir"
        .. " && grim -g \"$geometry\" - | tee $scrdir/$(date +" .. fileNameFormat .. ") | wl-copy"
    ),
    modify_before_save = hl.dsp.exec_cmd(
        "geometry=$(slurp)"
        .. " && scrdir=" .. screenshotsDirectory
        .. " && filepath=$scrdir/$(date +" .. fileNameFormat .. ")"
        .. " && mkdir -p $scrdir"
        .. " && grim -g \"$geometry\" - | satty --filename - --output-filename $filepath"
        .. " && [ -f $filepath ] && wl-copy < \"$filepath\""
    ),
    pin = hl.dsp.exec_cmd(
        "geometry=$(slurp)"
        .. " && grim -g \"$geometry\" - | feh - --class feh-pinned-screenshot --scale-down --auto-zoom --no-menus"
    ),
}
