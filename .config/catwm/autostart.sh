#! /bin/bash

#xset +fp ~/.fonts/ &
#xset fp rehash &
#wmname LG3D &

#xsetroot -cursor_name left_ptr &
xsetroot -xcf /usr/share/icons/Adwaita/cursors/left_ptr 16 &
compton -e 0.92 -o 0.92 -b &
feh --bg-scale ~/Pictures/Wallpapers/u_muhahah_the_sixer_5.jpg &
dunst -conf ~/.config/dunst/dunstrc &
notify-send -u low "Solus catwm" "All right" -i ~/.config/catwm/Solus.png &


NB=F#FF5e81ac
WH=F#FF929496
NEON=F#FF4666FF

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
    DATE_TIME=$(date +"%{$NB}%{F-}%{$WH} %d/%m %{F-}%{$NB}%{F-}%{$NEON} %H:%M%{F-}")
    echo -e  " %{$NB}\uf028%{F-} %{$WH}$VOLUME%{F-} | %{$NB}\uf538%{F-} %{$WH}$MEMORY%{F-} | %{$NB}\uf2db%{F-} %{$WH}$(cpu)%{F-} | %{$NB}\uf254%{F-} %{$WH}$UPTIME%{F-} | $DATE_TIME  "
}

ff="/tmp/$RANDOM.catwm.fifo"
[[ -p $ff ]] || mkfifo -m 600 "$ff"

while read -t 30 -r wmout || true; do

    printf "%s%s%s\n" "%{l} $wmout%{F#FF62FF00}$(riya) %{F#FF929496}$(catFocus)" "%{r}$(status)"
   #sleep 5s
done < "$ff" | lemonbar -d -g x18xx -u 3 -n "catwm" -B "#FF1F222D" -f "monospace:size=9" -f "Font Awesome 5 Brands Regular:style=Regular:size=9" -f "Font Awesome 5 Free Solid:style=Solid:size=9" &

catwm > "$ff"

rm $ff
