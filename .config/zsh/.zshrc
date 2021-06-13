
HISTSIZE=20000
SAVEHIST=20000
HISTFILE=~/.config/zsh/history

ZSH_CACHE_DIR=$HOME/.cache/zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

export VISUAL=nvim
# run cat and press the key to find
bindkey -v '^?' backward-delete-char
bindkey "^[[H"  beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[P"  delete-char
#zmodload zsh/complist
autoload -Uz compinit; compinit; _comp_options+=(globdots)
autoload -U colors; colors
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

setopt autocd
setopt sharehistory
setopt completealiases
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*:parameters'  list-colors '=*=32'
zstyle ':completion:*:commands' list-colors '=*=1;31'
zstyle ':completion:*:descriptions' format "$fg[green]%B -- %d -- %b"
zstyle ':completion:*:warnings' format "%B$fg[red]%}  No matches in  $fg[green]  %b $fg[white]%d"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=1;33'
zstyle ':completion:*:options' list-colors '=^(-- *)=1;31=34'
#zstyle ':completion:*:messages' format "%d"
stty stop undef	


if [ -f ~/Documents/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_all ]; then
    . ~/Documents/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_all
fi

PS1="%B%{$fg[red]%}[%{$fg[blue]%}%n%{$fg[green]%}@%{$fg[yellow]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

source /home/vj/.config/broot/launcher/bash/br
