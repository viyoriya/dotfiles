source /usr/share/defaults/etc/profile


export LFS=/mnt/lfs
export PATH=$PATH:/usr/local/bin/python3

if [ -f ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script ]; then
	. ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script
fi

alias 11='setxkbmap us'

#if [ -f ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_color_terminal ]; then 
#	. ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_color_terminal
#fi
