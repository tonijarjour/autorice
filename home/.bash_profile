if [ ! $DISPLAY ]; then
    [ $XDG_VTNR -le 2 ] && exec startx > /dev/null 2>&1
fi
