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
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ' ✗'
zstyle ':vcs_info:*' formats '%s:(%b)%c '
zstyle ':vcs_info:*' actionformats '%s:(%b)%c '
zstyle ':vcs_info:git*+set-message:*' hooks git-unstaged

+vi-git-unstaged() {
	if [ -n "${hook_com[unstaged]}" ]; then
		hook_com[staged]=' ✗'
	fi
}

precmd() {
	vcs_info
}

setopt PROMPT_SUBST
PROMPT='➜  %B%c ${vcs_info_msg_0_}%b'

alias dot='git --git-dir=${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles --work-tree=$HOME'
alias ls='ls --color=auto'
