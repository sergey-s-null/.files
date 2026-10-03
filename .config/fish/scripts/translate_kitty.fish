#!/usr/bin/env fish
set geometry (slurp); or exit 1

set current_dir (realpath (dirname (status filename)))

kitty --class="kitty-translation" -o window_padding_width=2 -o scrollbar=always fish -i -c "
    \"$current_dir/translate.fish\" \"$geometry\"
"
