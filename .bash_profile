[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	export EDITOR=vim
	export GOPATH="$HOME/.local/share/go"
	export IDEA_JDK=/usr/lib/jvm/java-11-openjdk
	export NPM_CONFIG_PREFIX="$HOME/.local/share/node_modules"
	export PATH="$HOME/.local/bin:$NPM_CONFIG_PREFIX/bin:$PATH"

	export XDG_DESKTOP_DIR="$HOME"
	export XDG_DOCUMENTS_DIR="$HOME/documents"
	export XDG_DOWNLOADS_DIR="$HOME/downloads"
	export XDG_MUSIC_DIR="$HOME/music"
	export XDG_PICTURES_DIR="$HOME/pictures"
	export XDG_VIDEOS_DIR="$HOME/videos"

	exec sway_run
fi
