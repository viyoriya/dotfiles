#! /bin/bash

os=$(grep '^ID=' /etc/os-release | cut -d"=" -f2-)

#export _JAVA_AWT_WM_NONREPARENTING=1
#wmname LG3D &

xrdb -merge ~/.Xresources

picom -e 0.92 -o 0.92 -b &
feh --bg-scale ~/Pictures/Wallpapers/wallpaper.png &
dunst -conf ~/.config/dunst/dunstrc &
notify-send -u low "$os dwm" "All right" -i ~/.config/dwm/util/dwm_logo.png

dwmblocks &

