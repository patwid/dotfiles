# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL='erasedups:ignorespace'
HISTSIZE=10000

#bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'

bold="\[$(tput bold)\]"
red="\[$(tput setaf 1)\]"
green="\[$(tput setaf 2)\]"
yellow="\[$(tput setaf 3)\]"
blue="\[$(tput setaf 4)\]"
cyan="\[$(tput setaf 6)\]"
reset="\[$(tput sgr0)\]"

git_info()
{
	local branch_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
	if [ -n "$branch_name" ]; then
		local state=''
		# Check for uncommitted changes in the index.
		if ! $(git diff --quiet --ignore-submodules --cached); then
			state=' ✗';
		# Check for unstaged changes.
		elif ! $(git diff-files --quiet --ignore-submodules --); then
			state=' ✗';
		# Check for untracked files.
		elif [ -n "$(git ls-files --others --exclude-standard)" ]; then
			state=' ✗';
		# Check for stashed files.
		elif $(git rev-parse --verify refs/stash &> /dev/null); then
			state=' ✗';
		fi;
		printf "${1}${branch_name}${2}${state} "
	else
		printf ""
	fi
}

exit_code()
{
	if [[ $? == 0 ]]; then
		printf "${1}"
	else
		printf "${2}"
	fi
}

PS1="${bold}\$(exit_code \"${green}\" \"${red}\")➜  ${cyan}\W \$(git_info \"${blue}git:(${red}\" \"${blue})${yellow}\")${reset}"

alias ls='ls --color=auto'
alias ssh='TERM=xterm-256color ssh'
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
