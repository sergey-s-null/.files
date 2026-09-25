-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly

require("config.monitors.binds.configure")

local monitors = require("config.monitors.list")

for i = 1, #monitors do
    monitors[i]:configure()
end
