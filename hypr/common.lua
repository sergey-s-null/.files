local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")
local noctCall = "noctalia msg "

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
}
