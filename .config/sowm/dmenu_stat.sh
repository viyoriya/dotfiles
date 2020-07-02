#!/bin/bash

function riya(){
        echo -e "  RIYA VIJAY"
}
function catFocus(){
    title=$(xdotool getwindowfocus getwindowname)
    [[ ! -z "$title" ]] && echo -e '\uf101' $title || echo ""
}
function cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "$cpu%"
}
function status {
    VOLUME="$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"
    MEMORY=$(free -m | awk '/Mem/ {printf "%d/%d MB\n", $3, $2 }')
    UPTIME=$(uptime | awk -F, '{print $1}' | awk '{$1=$2=""; print substr($0,3)}')
    DATE_TIME=$(date +" %d/%m  %H:%M")
    echo -e  "  $VOLUME |  $MEMORY |  $(cpu) |  $UPTIME | $DATE_TIME "
}

 echo "$(riya)" "$(status)" | dmenu -fn 'Iosevka:style=Bold:pixelsize=12' -nb '#2E3440' -nf '#929496' -sb '#7d7f82' -sf '#010b13'
  

