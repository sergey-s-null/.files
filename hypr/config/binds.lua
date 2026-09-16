local common = require("common")
local keys = require("config.keys")

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

-- Window manipulation
hl.bind("SUPER + " .. keys.ESCAPE, hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + " .. keys.Q, hl.dsp.window.close())
hl.bind("SUPER + ALT + " .. keys.SPACE, hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + CONTROL + " .. keys.SPACE, hl.dsp.window.pin({ action = "toggle" }))
hl.bind("SUPER + " .. keys.D, hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind("SUPER + " .. keys.F, hl.dsp.window.fullscreen())
hl.bind("SUPER + " .. keys.J, hl.dsp.layout("togglesplit"))

-- Move & Resize
hl.bind("SUPER + " .. keys.LEFT_MOUSE_BUTTON, hl.dsp.window.drag())
hl.bind("SUPER + " .. keys.RIGHT_MOUSE_BUTTON, hl.dsp.window.resize())
hl.bind(keys.F24, hl.dsp.window.drag())
hl.bind(keys.F23, hl.dsp.window.resize())

------------------
---- LAUNCHER ----
------------------

hl.bind("SUPER + " .. keys.RETURN, common.dsp.launch("kitty"))
hl.bind("SUPER + " .. keys.E, common.dsp.launch("dolphin"))
hl.bind("SUPER + " .. keys.T, common.dsp.launch("gnome-text-editor --new-window"))
hl.bind("CONTROL + SHIFT + " .. keys.ESCAPE, common.dsp.launch("kitty -e btop"))
hl.bind("SUPER + " .. keys.Z, common.dsp.sendNoctaliaMessage("settings-toggle"))
hl.bind("SUPER + " .. keys.O, common.dsp.sendNoctaliaMessage("panel-toggle launcher"))
hl.bind("SUPER + " .. keys.SEMICOLON, common.dsp.sendNoctaliaMessage("panel-toggle launcher /emo"))
hl.bind("SUPER + " .. keys.L, common.dsp.sendNoctaliaMessage("session lock"))
hl.bind("SUPER + ALT + " .. keys.C, common.dsp.sendNoctaliaMessage("panel-toggle session"))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", common.dsp.sendNoctaliaMessage("volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", common.dsp.sendNoctaliaMessage("volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", common.dsp.sendNoctaliaMessage("volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute", common.dsp.sendNoctaliaMessage("mic-mute"), { locked = true })

-- Media
hl.bind("XF86AudioPlay", common.dsp.sendNoctaliaMessage("media toggle"), { locked = true })
hl.bind("XF86AudioPause", common.dsp.sendNoctaliaMessage("media toggle"), { locked = true })
hl.bind("XF86AudioNext", common.dsp.sendNoctaliaMessage("media next"), { locked = true })
hl.bind("XF86AudioPrev", common.dsp.sendNoctaliaMessage("media previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", common.dsp.sendNoctaliaMessage("brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", common.dsp.sendNoctaliaMessage("brightness-down"), { locked = true, repeating = true })

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
local tools_submap = "tools"

hl.bind("SUPER + " .. keys.H, hl.dsp.submap(tools_submap))

hl.define_submap(tools_submap, "reset", function()
    hl.bind(keys.P, hl.dsp.exec_cmd("hyprpicker -a -n"))

    hl.bind(keys.CATCH_ALL, function() end)
    hl.bind(keys.ESCAPE, hl.dsp.submap("reset"))
end)

-- Theming and Wallpaper
hl.bind("SUPER + SHIFT + " .. keys.W, common.dsp.sendNoctaliaMessage("panel-toggle wallpaper"))

-- Clipboard
hl.bind("SUPER + " .. keys.V, common.dsp.sendNoctaliaMessage("panel-toggle clipboard"))

-- Notifications
hl.bind("SUPER + " .. keys.A, common.dsp.sendNoctaliaMessage("panel-toggle control-center notifications"))
