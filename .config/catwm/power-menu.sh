#!/bin/bash

#Custom Nord color
DMENU_OPT=" -i -nb #17191C -nf #7D7F82 -sb #4C566A -sf #D8DEE9 -fn Iosevka:style=Bold:pixelsize=12"    
DMENU="dmenu -p   $DMENU_OPT"

SESSON_ID=$(loginctl session-status | awk 'NR==1{print $1}')
Lock_command="slock"
Exit_command="loginctl terminate-session $SESSON_ID"
Reboot_command="systemctl reboot"
Shutdown_command="systemctl poweroff"

options=$' Lock\n Exit\n Reboot\n Shutdown' 
eval \$"$(echo "$options" | $DMENU | awk '{print $2}')_command"
exit 0
