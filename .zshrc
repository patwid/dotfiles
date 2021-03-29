autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
setopt HIST_IGNORE_ALL_DUPS

bindkey -e

alias ssh='TERM=xterm-256color ssh'
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias ls='ls --color=auto'

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%F{blue}%s:(%F{red}%b%F{blue}) "
precmd() {
	vcs_info
}

setopt prompt_subst
PROMPT='%B%(?:%F{green}:%F{red})➜  %F{cyan}%c ${vcs_info_msg_0_}%f%b'
