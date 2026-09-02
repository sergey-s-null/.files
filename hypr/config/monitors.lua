-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly

local monitor1 = {
    name = "DP-1",
    __disabled = false,

    init = function(self)
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
        hl.monitor({
            output = self.name,
            disabled = self.__disabled,
        })
    end,
}

local monitor2 = {
    name = "HDMI-A-1",
    __disabled = true,

    init = function(self)
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
        hl.monitor({
            output = self.name,
            disabled = self.__disabled,
        })
    end,
}

local monitors = {
    monitor1,
    monitor2,
}

local function configureMonitors()
    for i=1,#monitors do
        monitors[i]:init()
    end
end

local function configureBinds()
    local monitorsSubmap = "monitors"

    hl.bind("SUPER + M", hl.dsp.submap(monitorsSubmap))

    hl.define_submap(monitorsSubmap, function()
        for i=1,#monitors do
            hl.bind(i, function()
                monitors[i]:toggle()
            end)
        end

        hl.bind("catchall", function() end)
        hl.bind("escape", hl.dsp.submap("reset"))
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
