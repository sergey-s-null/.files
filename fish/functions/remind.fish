function remind
    # ANSI/Kitty Escape Sequence Reference:
    # \e[ -> Control Sequence Introducer (CSI)
    # \e[0m -> Reset all formatting
    # \e[1m -> Bold
    # \e[2m -> Dim/Faint
    # \e[38;2;R;G;Bm -> Foreground Color (24-bit RGB)

    set -l reset (printf "\e[0m")
    set -l bold (printf "\e[1m")
    set -l dim (printf "\e[2m")
    set -l italic (printf "\e[3m")
    set -l italic_reset (printf "\e[23m")

    set -l cyan (printf "\e[38;2;0;255;255m")
    set -l grey (printf "\e[38;2;180;180;180m")

    echo $bold$cyan"PACMAN"$reset
    echo "  "$dim$grey$italic"sudo"$italic_reset" pacman -S <pkg-name>"$reset" - install package."
    echo "  "$dim$grey"____ pacman -Ss <pkg-same>"$reset" - search for package."
    echo "  "$dim$grey$italic"sudo"$italic_reset" pacman -Syu"$reset
    echo "    "$dim$grey$italic"sudo"$italic_reset" pacman -Sy"$reset" - refresh database."
    echo "    "$dim$grey$italic"sudo"$italic_reset" pacman -Su"$reset" - update packages."
    echo "  "$dim$grey"cleanup"$reset" - alias for packages cleanup."
end
