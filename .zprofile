if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 && -f $HOME/.xinitrc && -x /usr/bin/startx ]]; then
	exec startx
fi
