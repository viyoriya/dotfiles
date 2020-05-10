

if [ -f ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script ]; then
        . ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script
fi


# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
#setopt autocd		# Automatically cd into typed directory.
#stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/history




source /home/vj/.config/broot/launcher/bash/br
