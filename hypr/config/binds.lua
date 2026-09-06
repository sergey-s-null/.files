local common = require("common")

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

-- Window manipulation
hl.bind("SUPER + Escape",          hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + Q",               hl.dsp.window.close())
hl.bind("SUPER + ALT + Space",     hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + CONTROL + Space", hl.dsp.window.pin({ action = "toggle" }))
hl.bind("SUPER + D",               hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind("SUPER + F",               hl.dsp.window.fullscreen())
hl.bind("SUPER + J",               hl.dsp.layout("togglesplit"))

-- Move & Resize
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
hl.bind("F24", hl.dsp.window.drag())
hl.bind("F23", hl.dsp.window.resize())

------------------
---- LAUNCHER ----
------------------

hl.bind("SUPER + Return",           common.dsp.launch("kitty"))
hl.bind("SUPER + E",                common.dsp.launch("dolphin"))
hl.bind("SUPER + T",                common.dsp.launch("gnome-text-editor --new-window"))
hl.bind("CONTROL + SHIFT + Escape", common.dsp.launch("kitty -e btop"))
hl.bind("SUPER + Z",                common.dsp.sendNoctaliaMessage("settings-toggle"))
hl.bind("SUPER + O",                common.dsp.sendNoctaliaMessage("panel-toggle launcher"))
hl.bind("SUPER + Semicolon",        common.dsp.sendNoctaliaMessage("panel-toggle launcher /emo"))
hl.bind("SUPER + L",                common.dsp.sendNoctaliaMessage("session lock"))
hl.bind("SUPER + ALT + C",          common.dsp.sendNoctaliaMessage("panel-toggle session"))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", common.dsp.sendNoctaliaMessage("volume-up"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", common.dsp.sendNoctaliaMessage("volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        common.dsp.sendNoctaliaMessage("volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute",     common.dsp.sendNoctaliaMessage("mic-mute"),    { locked = true })

-- Media
hl.bind("XF86AudioPlay",  common.dsp.sendNoctaliaMessage("media toggle"),   { locked = true })
hl.bind("XF86AudioPause", common.dsp.sendNoctaliaMessage("media toggle"),   { locked = true })
hl.bind("XF86AudioNext",  common.dsp.sendNoctaliaMessage("media next"),     { locked = true })
hl.bind("XF86AudioPrev",  common.dsp.sendNoctaliaMessage("media previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   common.dsp.sendNoctaliaMessage("brightness-up"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", common.dsp.sendNoctaliaMessage("brightness-down"), { locked = true, repeating = true })

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind("SUPER + P",     hl.dsp.exec_cmd("hyprpicker -a -n"))

-- Theming and Wallpaper
hl.bind("SUPER + SHIFT + W", common.dsp.sendNoctaliaMessage("panel-toggle wallpaper"))

-- Clipboard
hl.bind("SUPER + V", common.dsp.sendNoctaliaMessage("panel-toggle clipboard"))

-- Notifications
hl.bind("SUPER + A", common.dsp.sendNoctaliaMessage("panel-toggle control-center notifications"))
