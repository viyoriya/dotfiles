#! /bin/bash

DMENU_OPT=" -i -nb #17191C -nf #7D7F82 -sb #4C566A -sf #D8DEE9 -fn Iosevka:style=Bold:pixelsize=12"
DMENU="dmenu $DMENU_OPT"

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
    DATE_TIME=$(date +"  %d/%m   %H:%M")
    echo -e  " \uf028  $VOLUME | \uf538  $MEMORY | \uf2db  $(cpu) | \uf254  $UPTIME | $DATE_TIME  "
}

echo "$(status)" | $DMENU 
#dmenu -p "Stat" "$(status)"


