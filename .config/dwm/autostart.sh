#! /bin/bash

#export _JAVA_AWT_WM_NONREPARENTING=1

#wmname LG3D &
xrdb -merge ~/.Xresources

picom -e 0.92 -o 0.92 -b &
feh --bg-scale ~/Pictures/Wallpapers/archlinux-1.png &
dunst -conf ~/.config/dunst/dunstrc &
notify-send -u low "Arch dwm" "All right" -i ~/.config/dwm/dwm_logo.png

dwmblocks &

