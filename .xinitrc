#!/bin/sh

# $ xrdb ~/.Xresources
# Xcursor.theme:Adwaita
# Xcursor.size: 16

xclickroot -r xmenu-apps &
setxkbmap gb

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

session=${1:-dwm}

case $session in
        dwm           ) exec dwm;;
        i3            ) exec i3;;
        tmux          ) exec tmux;;
        st            ) exec st;;
        ob            ) exec ~/.config/openbox/autostart;;
        swm           ) exec spectrwm 2> /tmp/spectrwm.log;;
        sowm          ) exec ~/.config/sowm/autostart.sh;;
        mwm           ) exec ~/.config/monsterwm/autostart.sh ;;
	    catwm         ) exec ~/.config/catwm/autostart.sh ;;
		fwm           ) exec ~/.config/fwm/autostart.sh ;;
        *             ) exec $1;;
esac
