

## .zshenv → .zprofile → .zshrc → .zlogin → .zlogout

export ZDOTDIR=~/.config/zsh/
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.config/zsh/.zsh_history

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

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
# mouse scroll
bindkey "^Y" up-history
bindkey "^E" down-history
# Ctrl-A 
bindkey "^A" beginning-of-line
bindkey "^Z" end-of-line

setopt autocd
setopt sharehistory
setopt completealiases
setopt prompt_subst
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*:parameters'  list-colors '=*=32'
zstyle ':completion:*:commands' list-colors '=*=1;31'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
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

[[ $TERM = 'linux' ]] && alias tmux='tmux -u -f ~/.config/tmux/tmux.tty.conf'

if [ -f ~/Documents/GIT_PROJECTS/viyoriya/linuxScripts/zshScripts/.zshrc_all ]; then
    . ~/Documents/GIT_PROJECTS/viyoriya/linuxScripts/zshScripts/.zshrc_all
fi

[[ $TERM = 'st-256color' ]] && export PS1=$ZPS1 

if [ -f ~/Documents/GIT_PROJECTS/viyoriya/linuxScripts/zshScripts/.zsh_tech ]; then
    . ~/Documents/GIT_PROJECTS/viyoriya/linuxScripts/zshScripts/.zsh_tech
fi


