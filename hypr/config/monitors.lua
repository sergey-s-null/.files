-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly

local monitor1 = {
    __disabled = false,

    init = function(self)
        hl.monitor({
            output = MONITOR1,
            mode = "2560x1440@180Hz",
            position = "0x0",
            scale = 1,
            disabled = self.__disabled,
        })
    end,

    toggle = function(self)
        self.__disabled = not self.__disabled
        hl.monitor({
            output = MONITOR1,
            disabled = self.__disabled,
        })
    end,
}

local monitor2 = {
    __disabled = false,

    init = function(self)
        hl.monitor({
            output = MONITOR2,
            mode = "1920x1080@75Hz",
            position = "2560x0",
            scale = 1,
            disabled = self.__disabled,
        })
    end,

    toggle = function(self)
        self.__disabled = not self.__disabled
        hl.monitor({
            output = MONITOR2,
            disabled = self.__disabled,
        })
    end,
}

local monitors = {
    monitor1,
    monitor2,
}

for i=1,#monitors do
    monitors[i]:init()
end

local monitorsSubmap = "monitors"

hl.bind("SUPER + M", hl.dsp.submap(monitorsSubmap))

hl.define_submap(monitorsSubmap, function()
    for i=1,#monitors do
        hl.bind(i, function()
            monitors[i]:toggle()
        end)
    end

    hl.bind("escape", hl.dsp.submap("reset"))
end)

