local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")
local noctCall = "noctalia msg "

local function serialize(val)
    local function serialize_(val, indent)
        local t = type(val)

        if t == "string" then
            return string.format("%q", val)
        elseif t == "number" or t == "boolean" then
            return tostring(val)
        elseif t == "table" then
            local result = "{\n"
            for k, v in pairs(val) do
                local key_str = type(k) == "string" and ("[\"%s\"] = "):format(k) or ("[%d] = "):format(k)
                local next_indent = indent .. "    "
                result = result .. next_indent .. key_str .. serialize_(v, next_indent) .. ",\n"
            end
            return result .. indent .. "}"
        else
            return "nil"
        end
    end

    return serialize_(val, "")
end

local function create_state_provider(directory, file_name)
    local file_path = directory .. "/" .. file_name

    return {
        save = function(self, state)
            os.execute("mkdir \"" .. directory .. "\"")

            local file = io.open(file_path, "w")
            if not file then
                error("Could not open file \"" .. file_path .. "\" for writing.")
            end

            file:write("return " .. serialize(state))
            file:close()
        end,
        load = function(self)
            local result, state = pcall(dofile, file_path)
            if not result then
                return nil
            end

            return state
        end,
    }
end

local dspstr = {
    launch = function(command)
        return launchPrefix .. command
    end
}

return {
    dspstr = dspstr,
    dsp = {
        launch = function(command)
            return hl.dsp.exec_cmd(dspstr.launch(command))
        end,
        sendNoctaliaMessage = function(msg)
            return hl.dsp.exec_cmd(noctCall .. msg)
        end,
    },
    create_state_provider = create_state_provider,
}
