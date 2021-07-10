#! /bin/bash

#xset +fp ~/.fonts/ &
#xset fp rehash &
#wmname LG3D &
#xsetroot -cursor_name left_ptr &

xrdb -merge ~/.Xresources

xsetroot -xcf /usr/share/icons/Adwaita/cursors/left_ptr 16 &
picom -e 0.92 -o 0.92 -b &
feh --bg-scale ~/Pictures/Wallpapers/archlinux-1.png &
dunst -conf ~/.config/dunst/dunstrc &
notify-send -u low "Arch catwm" "All right" -i ~/.config/catwm/archlinux-logo-black.png &


NB=F#FF5e81ac
WH=F#FF929496
#NEON=F#FF4666FF
NEON=F#FF986671

export SYS_STATUS="Catwm"

function riya(){
        echo -e "    RIYA VIJAY   "
}
function catFocus(){
    title=$(xdotool getwindowfocus getwindowname)
    [[ ! -z "$title" ]] && echo -e '\uf101' $title || echo ""
}


usbmon() {
	usb1=$(lsblk -la | awk '/sdc1/ { print $1 }')

	if [ "$usb1" ]; then
			echo -e "%{$NB} %{F-} %{$WH}$usb1%{F-} | "
	fi
}

timer(){
    timerFile="/tmp/.timerFile"
    if [ -f $timerFile ]; then
        timer=$(cat $timerFile)
        tmpTime=$(date -d "$timer" +'%H:%M')
        timerSec=$(date +%s -d "$tmpTime")
        now=$(date +%s)
        timeDiff=$(( ($timerSec - $now) / 60 ))
        if [ "$timeDiff" -ge "0" ]; then
            echo -e "%{$NB} $timeDiff Min%{F-} |"
        else
            notify-send -u low "Timer" "done !!!" -i ~/.config/dwm/dwm_logo.png
            paplay ~/.config/dwm/mixkit-happy-bell-alert-601.wav
            rm $timerFile
        fi
    fi
}

network() {
	conntype=$(ip route | awk '/default/ { print substr($5,1,1) }')

	if [ -z "$conntype" ]; then
#		echo -e "%{$NB} %{F-}%{$WH}Down%{F-} "
		echo -e "%{$NB}  %{F-}"
	elif [ "$conntype" = "e" ]; then
		echo -e "  Up"
	elif [ "$conntype" = "w" ]; then
		echo -e "%{$NB} %{F-}"
	fi
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
    DATE_TIME=$(date +"%{$NB}%{F-}%{$WH} %d/%m %{F-}%{$NB}%{F-}%{$NEON} %H:%M%{F-}")
    echo -e  "$(timer) $(usbmon)$(network)| %{$NB}\uf028%{F-} %{$WH}$VOLUME %{F-} | %{$NB}\uf538%{F-} %{$WH}$MEMORY%{F-} | %{$NB}\uf2db%{F-} %{$WH}$(cpu) %{F-} | %{$NB}\uf254%{F-} %{$WH}$UPTIME%{F-} | $DATE_TIME  "
}

ff="/tmp/$RANDOM.catwm.fifo"
[[ -p $ff ]] || mkfifo "$ff"

while read -r line ; do        
    num="$(echo $line | sed -n 's/D://p')"
    [ ! -z "$num" ] && desktopNum=$num
    
    printf "%s%s\n" "%{l}  $desktopNum%{F#FF62FF00}$(riya) %{F#FF929496}$(catFocus)" "%{r}$(status)"
    sleep 0.5
done < "$ff" | lemonbar -p -d -g x19xx -u 2 -o -1  -n "catwm" -B "#FF1F222D" -f "Iosevka:style=Bold:size=8" -f "Font Awesome 5 Brands Regular:style=Regular:size=8" -f "Font Awesome 5 Free Solid:style=Solid:size=8" &

catwm > "$ff"

rm $ff
