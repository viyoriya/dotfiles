#!/bin/sh

# $ xrdb ~/.Xresources
# Xcursor.theme:Adwaita
# Xcursor.size: 16

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

session=${1:-dwm}

case $session in
        ob            ) exec ~/.config/openbox/autostart;;
        i3            ) exec i3;;
        tmux          ) exec tmux;;
        st            ) exec st;;
        swm           ) exec spectrwm 2> /tmp/spectrwm.log;;
        dwm           ) exec dwm 2> ~/tmp/dwm.log;;
        mwm           ) exec ~/.config/monsterwm/autostart.sh ;;
	    catwm         ) exec ~/.config/catwm/autostart.sh ;;
		fwm           ) exec ~/.config/fwm/autostart.sh ;;
        dmini         ) exec ~/.config/dmini/autostart.sh 2> /tmp/dminiwm.log;;
        *             ) exec $1;;
esac
