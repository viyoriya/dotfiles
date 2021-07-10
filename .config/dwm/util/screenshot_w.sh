#!/bin/bash

[[ ! -d "~/Pictures/Screenshots" ]] && mkdir -p ~/Pictures/Screenshots

scrot -u -d 5 ~/Pictures/Screenshots/%Y-%m-%d-%H-%M-%S.png
notify-send -u low "Scrot" "Screenshot [window] done !!!" -i ~/.local/share/icons/Papirus-Dark/32x32/devices/camera.svg; paplay  ~/.config/dwm/util/screen_capture.wav
