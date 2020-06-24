#! /bin/bash

#export _JAVA_AWT_WM_NONREPARENTING=1

#wmname LG3D &
compton -b &
feh --bg-scale ~/Pictures/Wallpapers/203564_grey.jpg &
dunst -conf ~/.config/dunst/dunstrc &
notify-send -u low "Solus dwm" "All right" -i ~/.config/dwm/dwm_logo.png

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "$cpu%"
}
while true; do
	VOLUME="$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"
	MEMORY=$(free -m | awk '/Mem/ {printf "%d/%d MB\n", $3, $2 }')
	UPTIME=$(uptime | awk -F, '{print $1}' | awk '{$1=$2=""; print substr($0,3)}')
	DATE_TIME=$(date +" %d/%m  %H:%M")
	xsetroot -name "  $VOLUME |  $MEMORY |  $(cpu) |  $UPTIME | $DATE_TIME "
	sleep 5s
done &

