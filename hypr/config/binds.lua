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
hl.bind("SUPER + Left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Down",  hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab",           hl.dsp.window.cycle_next())
hl.bind("SUPER + Tab",   hl.dsp.exec_cmd(noctCall .. "window-switcher"))

-- Move active window around workspaces & monitors
hl.bind("SUPER + SHIFT + Up",                   hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + Right",                hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + Left",                 hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + Down",                 hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + 1",                    hl.dsp.window.move({ monitor = MONITOR1 }))
hl.bind("SUPER + SHIFT + 2",                    hl.dsp.window.move({ monitor = MONITOR2 }))
hl.bind("SUPER + SHIFT + 3",                    hl.dsp.window.move({ monitor = MONITOR3 }))
hl.bind("SUPER + SHIFT + mouse_up",             hl.dsp.window.move({ monitor   = "-1" }))
hl.bind("SUPER + SHIFT + mouse_down",           hl.dsp.window.move({ monitor   = "+1" }))
hl.bind("SUPER + CONTROL + SHIFT + Right",      hl.dsp.window.move({ workspace = "m+1" }))
hl.bind("SUPER + CONTROL + SHIFT + Left",       hl.dsp.window.move({ workspace = "m-1" }))
hl.bind("SUPER + CONTROL + SHIFT + mouse_up",   hl.dsp.window.move({ workspace = "m-1" }))
hl.bind("SUPER + CONTROL + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "m+1" }))
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind("SUPER + SHIFT + CONTROL + " .. key, hl.dsp.window.move({ workspace = "m~" .. i }))
end

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
hl.bind("SUPER + Minus", function() zoomfunction(-0.3) end, { repeating = true})
hl.bind("SUPER + Plus", function() zoomfunction(0.3) end, { repeating = true })

--# Zoom with keypad
hl.bind("SUPER + code:82", function() zoomfunction(-0.3) end, { repeating = true })
hl.bind("SUPER + code:86", function() zoomfunction(0.3) end, { repeating = true })


------------------
---- LAUNCHER ----
------------------

hl.bind("SUPER + Return",     hl.dsp.exec_cmd(launchPrefix .. TERMINAL))
hl.bind("SUPER + E",          hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER))
hl.bind("SUPER + T",          hl.dsp.exec_cmd(launchPrefix .. EDITOR))
hl.bind("SUPER + C",          hl.dsp.exec_cmd(launchPrefix .. CALCULATOR))
hl.bind("XF86Calculator",           hl.dsp.exec_cmd(launchPrefix .. CALCULATOR))
hl.bind("SUPER + W",          hl.dsp.exec_cmd(launchPrefix .. BROWSER))
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"))
hl.bind("SUPER + Z",          hl.dsp.exec_cmd(noctCall .. "settings-toggle"))
hl.bind("SUPER + X",          hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"))
hl.bind("SUPER + O",          hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"))
hl.bind("SUPER + period",     hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"))
hl.bind("SUPER + L",          hl.dsp.exec_cmd(noctCall .. "session lock"))
hl.bind("SUPER + ALT + C",    hl.dsp.exec_cmd(noctCall .. "panel-toggle session"))

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

-- Focus on monitors
hl.bind("SUPER + 1", hl.dsp.focus({ monitor = MONITOR1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ monitor = MONITOR2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ monitor = MONITOR3 }))

-- Focus on workspace number
-- Absolute
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind("SUPER + ALT + " .. key, hl.dsp.focus({ workspace = i }))
end
-- Relative
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind("SUPER + CONTROL + " .. key, hl.dsp.focus({ workspace = "m~" .. i }))
end

-- Move to adjacent workspaces and next empty on a given monitor
hl.bind("SUPER + CONTROL + Right",       hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + CONTROL + Left",        hl.dsp.focus({ workspace = "m-1" }))
hl.bind("SUPER + CONTROL + Down",        hl.dsp.focus({ workspace = "emptym" }))

-- Scroll through existing workspaces & monitors
hl.bind("SUPER + mouse_down",           hl.dsp.focus({ workspace = "m-1" }))
hl.bind("SUPER + mouse_up",             hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + CONTROL + mouse_up",   hl.dsp.focus({ workspace = "m-1" }))
hl.bind("SUPER + CONTROL + mouse_down", hl.dsp.focus({ workspace = "m+1" }))

-- Special workspace (scratchpad)
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special())
