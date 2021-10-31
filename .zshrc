autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

bindkey -e

typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
#key[Control-Enter]="${terminfo[kent5]}"
#key[Shift-Enter]="${terminfo[kent2]}"

[[ -n "${key[Home]}" ]] && bindkey -- "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey -- "${key[End]}" end-of-line
[[ -n "${key[Insert]}" ]] && bindkey -- "${key[Insert]}" overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}" ]] && bindkey -- "${key[Delete]}" delete-char
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[Left]}" ]] && bindkey -- "${key[Left]}" backward-char
[[ -n "${key[Right]}" ]] && bindkey -- "${key[Right]}" forward-char
[[ -n "${key[PageUp]}" ]] && bindkey -- "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]] && bindkey -- "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete
[[ -n "${key[Control-Left]}" ]] && bindkey -- "${key[Control-Left]}" backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
#[[ -n "${key[Control-Enter]}" ]] && bindkey -- "${key[Control-Enter]}" accept-line
#[[ -n "${key[Shift-Enter]}" ]] && bindkey -- "${key[Shift-Enter]}" accept-line

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	zle_application_mode_start() { echoti smkx }
	zle_application_mode_stop() { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

bindkey '^[[27;2;13~' accept-line  # shift+return
bindkey '^[[27;5;13~' accept-line  # ctrl+return

bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search

exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

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

precmd() { vcs_info }

setopt PROMPT_SUBST
PROMPT='➜  %B%c ${vcs_info_msg_0_}%b'

alias dot="git --git-dir=${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles --work-tree=$HOME"
alias ls='ls --color=auto'
alias ssh='TERM=xterm-256color ssh'
