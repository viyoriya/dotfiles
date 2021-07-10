
SAVEHIST=20000
HISTFILE=~/.config/zsh/history

ZSH_CACHE_DIR=$HOME/.cache/zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

export VISUAL=nvim
#zmodload zsh/complist
autoload -Uz compinit; compinit; _comp_options+=(globdots)
autoload -U colors; colors
autoload -Uz vcs_info
#open nvim to edit the command
#check bindkey -l, bindkey -M vicmd, zle -al
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# run cat and press the key to find the value
bindkey -v '^?' backward-delete-char
bindkey "^[[H"  beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[P"  delete-char

setopt autocd
setopt sharehistory
setopt completealiases
setopt prompt_subst

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
zstyle ':vcs_info:git*' formats "%{$fg[red]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "

stty stop undef	

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
RPROMPT=\$vcs_info_msg_0_

if [ -f ~/Documents/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_all ]; then
    . ~/Documents/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_all
fi
export PS1=$ZPS1

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/key-bindings.zsh ] && source /usr/share/doc/fzf/key-bindings.zsh


#source ~/.config/zsh/zsh-syntax-highlighting.zsh
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') 
