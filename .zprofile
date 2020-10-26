if [ "$(tty)" = "/dev/tty1" ]; then
	export PATH="$HOME/.local/bin:$PATH"
	export EDITOR=vim
	export GOPATH=~/.local/share/go
	export MOZ_ENABLE_WAYLAND=1
	export QT_QPA_PLATFORM=wayland
	export QT_QPA_PLATFORMTHEME=qt5ct
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
	#export QT_WAYLAND_FORCE_DPI=72
	#export QT_WAYLAND_FORCE_DPI=96
	#export QT_WAYLAND_FORCE_DPI=phsyical
	export XDG_SESSION_TYPE=wayland
	export XDG_CURRENT_DESKTOP=sway
	export _JAVA_AWT_WM_NONREPARENTING=1

	#exec ssh-agent startx &> /dev/null
	exec ssh-agent sway &> /dev/null
fi
