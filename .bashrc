source /usr/share/defaults/etc/profile

#export _JAVA_AWT_WM_NONREPARENTING=1
#export PATH_TO_FX=/opt/javafx-sdk-14.0.1/lib
#export LFS=/mnt/lfs
#export JAVA_HOME=/usr/lib/jdk-14.0.1
export JAVA_HOME=/usr/lib/openjdk-8
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:/usr/bin/python3

#export PATH=$PATH:$PATH_TO_FX

if [ -f ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script ]; then
	. ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script
fi

#bind 'TAB:menu-complete'
#bind 'set show-all-if-ambiguous on'
#bind '"\e[Z":menu-complete-backward'

source /home/vj/.config/broot/launcher/bash/br

export FFF_LS_COLORS=1
export FFF_HIDDEN=1
#export FFF_COL1=1 #Dir 
#export FFF_COL2=2 #Status Bar
#export FFF_COL4=3 #Cursor
function ldm(){
    ls ${1} | dmenu -i -l 20 -fn 'Iosevka:style=Bold:pixelsize=12' -nb '#2E3440' -nf '#929496' -sb '#7d7f82' -sf '#010B13'
}

