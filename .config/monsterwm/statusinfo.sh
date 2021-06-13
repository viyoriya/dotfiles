#!/usr/bin/env sh

# expects a line from monsterwm's output as argument ("$1")
# prints formatted output to be used as input for bar
# reference: bar by LemonBoy -- https://github.com/LemonBoy/bar

# desktop status
for desk; do
    d="${desk%%:*}" desk="${desk#*:}" # desktop id
    w="${desk%%:*}" desk="${desk#*:}" # window count
    l="${desk%%:*}" desk="${desk#*:}" # layout mode
    c="${desk%%:*}" desk="${desk#*:}" # is current desktop
    u="$desk"                         # has urgent hint

    # desktop id
    case "$d" in
        0) d=" term" ;; 1) d=" web" ;;
        2) d=" img" ;;
    esac

    # current desktop
    if [ $c -ne 0 ]
    then bg="\b7" un="\u6" fg="\f9"
        case "$l" in
            0) s="" ;; 1) s="" ;; 2) s="" ;;
            3) s="" ;; 4) s="" ;;
        esac && s="\b8\u8 $s \br\ur"
    fi

    # has urgent hint or no windows
    [ $u -ne 0 ] && un="\u2"
    [ $w -eq 0 ] && w="-"

    in="$in$bg$fg$un $d \f8[$w] \ur\br\fr"
    unset bg fg un
done


# music status
music="$(mpc current -f "%artist% - [%title%|%file%]")"
if [ -z "$music" ]; then music="nothing to see here" mstat=""
else
    mstat="$(mpc | sed -rn '2s/\[([[:alpha:]]+)].*/\1/p')"
    [ "$mstat" == "paused" ] && mstat="" || mstat=""
fi

# volume status
if [ "$(amixer get Master | sed -nr '$ s:.*\[(.+)]$:\1:p')" == "off" ]
then vol="[m]" vstat=""
else
    vol="$(amixer get PCM | sed -nr '$ s:.*\[(.+%)].*:\1:p')"
    if   [ "${vol%\%}" -le 10 ]; then vstat=""
    elif [ "${vol%\%}" -le 20 ]; then vstat=""; else vstat=""; fi
fi

# date and time
date="$(date +"%R")" dstat=""

# symbols
arrow=""

printf '%s %s %s' "$in" "$arrow " "$s" "\r"
printf ' \\b7\\u6\\f1 %s \\br\\ur\\fr %s' "$mstat" "$music" "$vstat" "$vol" "$dstat" "$date "
printf '\n'
