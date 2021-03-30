# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BOLD="$(tput bold)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
BLUE="$(tput setaf 4)"
CYAN="$(tput setaf 6)"
RESET="$(tput sgr0)"

branch_name()
{
	local ref=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
	if [ -n "$ref" ]; then
		printf "${BLUE}git:(${RED}$ref${BLUE}) "
	else
		printf ""
	fi
}

exit_code()
{
	if [[ $? == 0 ]]; then
		printf "${GREEN}"
	else
		printf "${RED}"
	fi
}

PS1="${BOLD}\$(exit_code)➜  ${CYAN}\W \$(branch_name)${RESET}"

alias ls='ls --color=auto'
alias ssh='TERM=xterm-256color ssh'
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
