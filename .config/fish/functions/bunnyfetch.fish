function bunnyfetch
    command tput clear
    set packages (pacman -Qq | wc -l)
    set wmname (xprop -id (xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}') -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \" | head -n 1)
    set kernel (uname -r | cut -d '-' -f1)
    set resolution (xrandr --listmonitors | grep / | awk  -F'[ /x]' '{sum += $4} END {printf sum"x"$6" "}')
    set shellname (basename $SHELL)

    echo "             "(set_color red)  (set_color normal) $wmname
    echo "    (\ /)    "(set_color yellow)  (set_color normal) $kernel
    echo "    ( . .)   "(set_color green)  (set_color normal) $shellname
    echo "    c("(set_color red)'"'(set_color normal)")("(set_color red)'"'(set_color normal)")  "(set_color magenta)  (set_color normal) $resolution
    echo "             "(set_color blue)  (set_color normal) $packages
end
