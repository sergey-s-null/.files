local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")
local noctCall = "noctalia msg "

return {
    dsp = {
        launch = function(command)
            return hl.dsp.exec_cmd(launchPrefix .. command)
        end,
        sendNoctaliaMessage = function(msg)
            return hl.dsp.exec_cmd(noctCall .. msg)
        end,
    }
}
