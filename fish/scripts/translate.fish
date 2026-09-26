#!/usr/bin/env fish
if test (count $argv) -ne 1
    echo "Expected single argument - geometry." >&2
    exit 1
end
set geometry $argv[1]

echo "Geometry is $geometry"

if test -z "$geometry"
    echo "No geometry."
    read -n 1
    exit 1
end

set text (grim -g "$geometry" - | tesseract - - -l eng)
set text_status $pipestatus
if test $text_status[1] -ne 0
    echo "Grim failed." >&2
    read -n 1
    exit 1
end
if test $text_status[2] -ne 0
    echo "Tesseract failed." >&2
    read -n 1
    exit 1
end
if test -z (string trim "$text")
    echo "Text recognized by tesseract is empty. Text: \"$text\"." >&2
    read -n 1
    exit 1
end

set translated (trans en:ru "$text" | string collect)
if test $status -ne 0
    echo "Error on translating." >&2
    read -n 1
    exit 1
end

function render
    clear
    echo -en "\\033[3J"
    echo "$translated"
end

function on_winch --on-signal WINCH
    render
end

render
read -n 1
