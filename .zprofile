if [ -z "$DISPLAY" ] && [ "$(tty)" = /dev/tty1 ]; then
	exec sway-run
fi
