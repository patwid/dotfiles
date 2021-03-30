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

bindkey -M menuselect '^H' backward-char
bindkey -M menuselect '^K' up-line-or-history
bindkey -M menuselect '^L' forward-char
bindkey -M menuselect '^J' down-line-or-history

alias ssh='TERM=xterm-256color ssh'
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias ls='ls --color=auto'

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%F{blue}%s:(%F{red}%b%F{blue}) "
precmd() {
	vcs_info
}

setopt PROMPT_SUBST
PROMPT='%B%(?:%F{green}:%F{red})➜  %F{cyan}%c ${vcs_info_msg_0_}%f%b'
