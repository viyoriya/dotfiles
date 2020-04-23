#!/usr/bin/env sh

##0073ff

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "$cpu%"
}
function status {
    VOLUME=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
    MEMORY=$(free -m | awk '/Mem/ {printf "%d/%d MB\n", $3, $2 }')
    UPTIME=$(uptime | awk -F, '{print $1}' | awk '{$1=$2=""; print substr($0,3)}')    
    D_TIME=$(date +" %d/%m  %H:%M")

    VOL="<span color='#A3A3A3'>\uf028 $VOLUME</span>"
    MEM="<span color='#8F8F8F'>\uf538 $MEMORY</span>"
    CPU="<span color='#8F8F8F'>\uf2db $(cpu)</span>"
    UPT="<span color='#8F8F8F'>\uf254 $UPTIME</span>" 
    DTT="<span color='#9B9B9B'>$D_TIME</span>"

    echo -e  "$VOL $MEM $CPU $UPT $DTT"
}

printf "%s\n" "$(status)"