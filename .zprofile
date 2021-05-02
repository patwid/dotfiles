if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	#exec ssh-agent startx &> /dev/null
	exec ssh-agent sway &> /dev/null
fi
