-- https://github.com/tesseract-ocr/tesseract

local function exec(lang)
    local cmd =
        "geometry=$(slurp)"
        .. " && grim -g \"$geometry\" - | tesseract - -"

    if lang then
        cmd = cmd .. " -l " .. lang
    end

    cmd = cmd .. " | wl-copy"

    return hl.dsp.exec_cmd(cmd)
end

return {
    dsp = {
        exec_any_lang = function() return exec() end,
        exec_eng = function() return exec("eng") end,
        exec_rus = function() return exec("rus") end,
    }
}
