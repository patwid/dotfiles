autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

bindkey -e

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

bindkey '^[[Z' reverse-menu-complete
bindkey -M menuselect '^H' backward-char
bindkey -M menuselect '^K' up-line-or-history
bindkey -M menuselect '^L' forward-char
bindkey -M menuselect '^J' down-line-or-history

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' stagedstr   ' ✗'
zstyle ':vcs_info:*' formats       "%F{blue}%s:(%F{red}%b%F{blue})%F{yellow}%c "
zstyle ':vcs_info:*' actionformats "%F{blue}%s:(%F{red}%b%F{blue})%F{yellow}%c "
precmd() { vcs_info }

setopt PROMPT_SUBST
PROMPT='%(?:%F{green}:%F{red})➜  %B%F{cyan}%c ${vcs_info_msg_0_}%f%b'

alias ssh='TERM=xterm-256color ssh'
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias ls='ls --color=auto'
