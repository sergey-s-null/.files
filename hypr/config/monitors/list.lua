local common = require("common")
local keys = require("config.keys")

local state_directory = os.getenv("HOME") .. "/.local/state/hypr"
local state_file_name = "monitors"
local state_provider = common.create_state_provider(state_directory, state_file_name)

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
}

local state = state_provider:load() or {}

local function toggle(self)
    self.__disabled = not self.__disabled
    self:configure()
    state[self.name]["disabled"] = self.__disabled
    state_provider:save(state)
end

local monitors = {
    monitor1,
    monitor2,
}

for _, monitor in pairs(monitors) do
    monitor.toggle = toggle
    if not state[monitor.name] then
        state[monitor.name] = {
            ["disabled"] = false,
        }
    end
    monitor.__disabled = state[monitor.name]["disabled"]
end

return monitors
