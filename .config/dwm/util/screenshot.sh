#!/bin/bash

[[ ! -d "~/Pictures/Screenshots" ]] && mkdir -p ~/Pictures/Screenshots

scrot -d 5 ~/Pictures/Screenshots/%Y-%m-%d-%H-%M-%S.png
notify-send -u low "Scrot" "Screenshot done !!!" -i ~/.local/share/icons/Papirus-Dark/32x32/devices/camera.svg; paplay screen_capture.wav
