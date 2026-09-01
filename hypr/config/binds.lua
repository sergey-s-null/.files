local noctCall = "noctalia msg "
local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

-- Window manipulation
hl.bind("SUPER + Escape",      hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + Q",           hl.dsp.window.close())
hl.bind("SUPER + ALT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + D",           hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind("SUPER + F",           hl.dsp.window.fullscreen())
hl.bind("SUPER + J",           hl.dsp.layout("togglesplit"))

-- Change focus
hl.bind("SUPER + Tab",         hl.dsp.exec_cmd(noctCall .. "window-switcher"))

-- Move & Resize
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
hl.bind("F24", hl.dsp.window.drag())
hl.bind("F23", hl.dsp.window.resize())

-- Zoom
local function zoomfunction(value)
    local zoomvalue = hl.get_config("cursor:zoom_factor")
    if (zoomvalue + value) > 3.0 then
        hl.config({ cursor = { zoom_factor = 3.0 } })
    elseif (zoomvalue + value) < 1.0 then
        hl.config({ cursor = { zoom_factor = 1.0 } })
    else
        hl.config({ cursor = { zoom_factor = zoomvalue + value } })
    end
end
hl.bind("SUPER + Minus", function() zoomfunction(-0.5) end, { repeating = true})
hl.bind("SUPER + Equal", function() zoomfunction(0.5) end, { repeating = true })

------------------
---- LAUNCHER ----
------------------

hl.bind("SUPER + Return",           hl.dsp.exec_cmd(launchPrefix .. TERMINAL))
hl.bind("SUPER + E",                hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER))
hl.bind("SUPER + T",                hl.dsp.exec_cmd(launchPrefix .. EDITOR))
hl.bind("SUPER + C",                hl.dsp.exec_cmd(launchPrefix .. CALCULATOR))
hl.bind("XF86Calculator",           hl.dsp.exec_cmd(launchPrefix .. CALCULATOR))
hl.bind("SUPER + W",                hl.dsp.exec_cmd(launchPrefix .. BROWSER))
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"))
hl.bind("SUPER + Z",                hl.dsp.exec_cmd(noctCall .. "settings-toggle"))
hl.bind("SUPER + O",                hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"))
hl.bind("SUPER + period",           hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"))
hl.bind("SUPER + L",                hl.dsp.exec_cmd(noctCall .. "session lock"))
hl.bind("SUPER + ALT + C",          hl.dsp.exec_cmd(noctCall .. "panel-toggle session"))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd(noctCall .. "mic-mute"),    { locked = true })

-- Media
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(noctCall .. "media toggle"),   { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"),   { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(noctCall .. "media next"),     { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(noctCall .. "brightness-up"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true })

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind("SUPER + P",     hl.dsp.exec_cmd("hyprpicker -a -n"))

-- Theming and Wallpaper
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"))

-- Clipboard
hl.bind("SUPER + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"))

-- Notifications
hl.bind("SUPER + A", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications"))

-------------------------------
---- WORKSPACES & MONITORS ----
-------------------------------

-- Special workspace (scratchpad)
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special())
