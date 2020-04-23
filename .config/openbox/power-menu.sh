#!/bin/bash

# small power menu using rofi for openbox (systemd)
# tostiheld, 2016
# Updated : viyoriya 2019
# Updated : viyoriya 2020 for openbox

#Openbox doesn't require these below commands
#SESSON_ID=$(loginctl session-status | awk 'NR==1{print $1}')
#Exit_command="loginctl terminate-session $SESSON_ID"

Lock_command="slock"
Exit_command="openbox --exit"
Reboot_command="systemctl reboot"
Shutdown_command="systemctl poweroff"

rofi_command="rofi -width 11 -height 25 -lines 4"
options=$' Lock\n Exit\n Reboot\n Shutdown' 
eval \$"$(echo "$options" | $rofi_command -dmenu -p '' | awk '{print $2}')_command"
exit 0