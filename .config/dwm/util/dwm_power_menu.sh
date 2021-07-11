#!/bin/bash

DMENU_OPT=" -i -nb #2E3440 -nf #929496 -sb #929496 -sf #2E3440 -fn Iosevka:style=Regular:size=11"    
DMENU="dmenu -p   $DMENU_OPT"

SESSON_ID=$(loginctl session-status | awk 'NR==1{print $1}')
Lock_command="slock"
Exit_command="loginctl terminate-session $SESSON_ID"
Reboot_command="systemctl reboot"
Shutdown_command="systemctl poweroff"

options=$' Lock\n Exit\n Reboot\n Shutdown' 
eval \$"$(echo "$options" | $DMENU | awk '{print $2}')_command"
