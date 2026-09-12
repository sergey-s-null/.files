-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly

local keys = require("config.keys")

local monitor1 = {
    name = "DP-1",
    key = keys._1,
    __disabled = false,

    configure = function(self)
        hl.monitor({
            output = self.name,
            mode = "2560x1440@180Hz",
            position = "0x0",
            scale = 1,
            disabled = self.__disabled,
        })
    end,

    toggle = function(self)
        self.__disabled = not self.__disabled
        self:configure()
    end,
}

local monitor2 = {
    name = "HDMI-A-1",
    key = keys._2,
    __disabled = false,

    configure = function(self)
        hl.monitor({
            output = self.name,
            mode = "1920x1080@75Hz",
            position = "2560x0",
            scale = 1,
            disabled = self.__disabled,
        })
    end,

    toggle = function(self)
        self.__disabled = not self.__disabled
        self:configure()
    end,
}

local monitors = {
    monitor1,
    monitor2,
}

local function configureMonitors()
    for i = 1, #monitors do
        monitors[i]:configure()
    end
end

local function configureBinds()
    local monitorsSubmap = "monitors"

    hl.bind("SUPER + " .. keys.M, hl.dsp.submap(monitorsSubmap))

    hl.define_submap(monitorsSubmap, function()
        for i = 1, #monitors do
            local monitor = monitors[i]
            hl.bind(monitor.key, function()
                monitor:toggle()
            end)
        end

        hl.bind(keys.CATCH_ALL, function() end)
        hl.bind(keys.ESCAPE, hl.dsp.submap("reset"))
    end)
end

local function configure()
    configureMonitors()
    configureBinds()
end

return {
    configure = configure,
    monitors = monitors,
}
