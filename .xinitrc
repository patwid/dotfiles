# required for pinentry-gnome3, see https://bugs.archlinux.org/task/58368
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

xrdb ~/.Xresources
xset s off
xset -dpms
xset r rate 200 30
setxkbmap -variant altgr-intl -option caps:swapescape
numlockx &
picom --daemon
dunst &
redshift &

exec i3 &> /dev/null
