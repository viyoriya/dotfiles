source /usr/share/defaults/etc/profile


#export _JAVA_AWT_WM_NONREPARENTING=1
#export PATH_TO_FX=/opt/javafx-sdk-14.0.1/lib
export LFS=/mnt/lfs
#export JAVA_HOME=/usr/lib/jdk-14.0.1
export JAVA_HOME=/usr/lib/openjdk-8
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:/usr/bin/python3
export PATH=$PATH:$PATH_TO_FX


if [ -f ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script ]; then
	. ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script
fi
export PS1="\[\e[31m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[34m\] \w\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[36m\] \[\e[m\] "
#alias 11='setxkbmap us'
#alias 96='xmodmap -e "keycode 96 = a A"'

#if [ -f ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_color_terminal ]; then 
#	. ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_color_terminal
#fi

source /home/vj/.config/broot/launcher/bash/br
