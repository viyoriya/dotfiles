# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
export JAVA_HOME=/usr/lib64/jvm/default
export M2_HOME=/home/vj/SOFTWARE/apache-maven-3.8.1
export GRADLE_USER_HOME=/home/vj/SOFTWARE/gradleRepo

export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$M2_HOME/bin
export PATH=$PATH:/opt/gradle/gradle-6.2.2/bin

if [ -f ~/Documents/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_all ]; then
	. ~/Documents/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_all
fi

[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/doc/fzf/key-bindings.bash ]] && source /usr/share/doc/fzf/key-bindings.bash

