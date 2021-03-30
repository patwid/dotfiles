[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
	export EDITOR=nvim
	export GOPATH="$HOME/.local/share/go"
	export IDEA_JDK=/usr/lib/jvm/java-11-openjdk
	export MOZ_ENABLE_WAYLAND=1
	export NPM_CONFIG_PREFIX="$HOME/.local/share/node_modules"
	export PATH="$HOME/.local/bin:$HOME/.local/share/node_modules/bin:$PATH"
	export QT_QPA_PLATFORM=wayland
	export QT_QPA_PLATFORMTHEME=qt5ct
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
	export XDG_CURRENT_DESKTOP=sway
	export XDG_DESKTOP_DIR="$HOME"
	export XDG_DOCUMENTS_DIR="$HOME/documents"
	export XDG_DOWNLOADS_DIR="$HOME/downloads"
	export XDG_MUSIC_DIR="$HOME/music"
	export XDG_PICTURES_DIR="$HOME/pictures"
	export XDG_SESSION_TYPE=wayland
	export XDG_VIDEOS_DIR="$HOME/videos"
	export _JAVA_AWT_WM_NONREPARENTING=1

	#exec ssh-agent startx &> /dev/null
	exec ssh-agent sway &> /dev/null
fi