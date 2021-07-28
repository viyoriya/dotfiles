#! /bin/bash

os=$(grep '^ID=' /etc/os-release | cut -d"=" -f2-)

#xset +fp ~/.fonts/ &
#xset fp rehash &
#wmname LG3D &
#xsetroot -cursor_name left_ptr &

numlockx &

xrdb -merge ~/.Xresources

xsetroot -xcf /usr/share/icons/Adwaita/cursors/left_ptr 16 &
picom -e 0.92 -o 0.92 -b &
feh --bg-scale ~/Pictures/Wallpapers/archlinux-1.png &
dunst -conf ~/.config/dunst/dunstrc &
notify-send -u low "$os catwm" "All right" -i ~/.config/catwm/util/dwm_logo.png &

NB=F#FF5e81ac
WH=F#FF929496
#NEON=F#FF4666FF
NEON=F#FF986671


function riya(){
        echo -e "    RIYA VIJAY   "
}

function catFocus(){
    title=$(xdotool getwindowfocus getwindowname)
    [[ ! -z "$title" ]] && echo -e '\uf101' $title || echo ""
}

function ufw(){

    ufwstatus=$(sudo ufw status | awk '{ print $2 }')

    if [ "$ufwstatus" = "active" ]; then
           echo -e " "
    elif [ "$ufwstatus" = "inactive" ]; then
          echo -e " "
    fi

}

function timer(){
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
            notify-send -u low "Timer" "done !!!" -i ~/.config/catwm/util/dwm_logo.png
            paplay ~/.config/catwm/util/mixkit-happy-bell-alert-601.wav
            rm $timerFile
        fi
    fi
}

function usbmon() {
    usb1=$(lsblk -la | awk '/sdc1/ { print $1 }')

    if [ "$usb1" ]; then
        echo -e "%{$NB} %{F-} %{$WH}$usb1%{F-} | "
    fi
}

function network() {
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


function power_on() {
    if bluetoothctl show | grep -q "Powered: yes"; then
        return 0
    else
        return 1
    fi
}

function device_connected() {
    device_info=$(bluetoothctl info "$1")
    if echo "$device_info" | grep -q "Connected: yes"; then
        return 0
    else
        return 1
    fi
}

function bluetooth(){

if power_on; then
    
    DEVICES=""
    mapfile -t paired_devices < <(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
    counter=0

    for device in "${paired_devices[@]}"; do
        if device_connected $device; then
            device_alias=$(bluetoothctl info $device | grep "Alias" | cut -d ' ' -f 2-)

            if [ $counter -gt 0 ]; then
                DEVICES+=", ${device_alias}"
            else
                DEVICES+=" ${device_alias}"
            fi

            ((counter++))
        fi
    done
   
    [[ ! -z "$DEVICES" ]] &&  echo -e "%{$NB}%{F-} $DEVICES" || echo -e "" 

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
    echo -e  "$(timer) $(usbmon) $(bluetooth) $(network)| %{$NB} %{F-}%{$WH}$VOLUME %{F-} | %{$NB} %{F-}%{$WH}$MEMORY%{F-} | %{$NB} %{F-}%{$WH}$(cpu)%{F-} | %{$NB} %{F-}%{$WH}$UPTIME%{F-} | $DATE_TIME | %{$NB}$(ufw)%{F-}"
}

ff="/tmp/$RANDOM.catwm.fifo"
[[ -p $ff ]] || mkfifo "$ff"

desktopNum=""
while true 
do
    if read line ; then
        num="$(echo $line | sed -n 's/D://p')"
        [ ! -z "$num" ] && export desktopNum=$num
    fi    
    
    printf "%s%s\n" "%{l}  $desktopNum%{F#FF62FF00}$(riya) %{F#FF929496}$(catFocus)" "%{r}$(status)"
    sleep 3s
done < "$ff" | lemonbar -p -d -g x21x1 -u 2 -o -1  -n "catwm" -B "#FF1F222D" -f "Iosevka:style=Bold:size=10" -f "Font Awesome 5 Brands Regular:style=Regular:size=11" -f "Font Awesome 5 Free Solid:style=Solid:size=11" &

catwm > "$ff"

rm $ff
