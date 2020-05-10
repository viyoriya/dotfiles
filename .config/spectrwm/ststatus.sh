#!/usr/bin/env sh

#export _JAVA_AWT_WM_NONREPARENTING=1
#wmname LG3D &
feh --bg-scale ~/Pictures/Wallpapers/37572_grey_1.jpg &
dunst -conf ~/.config/dunst/dunstrc &
notify-send -u low "Solus SpectrWm" "All right" -i ~/.config/spectrwm/Solus.png &

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
    D_TIME=$(date +"+@fn=1;\uf073+@fn=0; %d/%m  +@fn=1;\uf017+@fn=0; %H:%M")

    VOL="+@fg=5;+@fn=1;\uf028+@fn=0;  $VOLUME +@fg=0; | "
    MEM="+@fg=2;+@fn=1;\uf538+@fn=0;  $MEMORY +@fg=0; | "
    CPU="+@fg=3;+@fn=1;\uf2db+@fn=0;  $(cpu)  +@fg=0; | "
    UPT="+@fg=4;+@fn=1;\uf254+@fn=0;  $UPTIME +@fg=0; | " 
    DTT="+@fg=1;$D_TIME "

    echo -e  "$VOL $MEM $CPU $UPT $DTT"
}

SLEEP_SEC=5
while :; do
    echo "$(status)"
  sleep $SLEEP_SEC
done

#+@fg=1 => 1st fg color from bar_font_color
#+@fn=1 => 1st font from bar_font
#
#