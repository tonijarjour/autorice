# ~/.bash_profile
[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ ! $DISPLAY ]; then
    [ $XDG_VTNR -eq 1 ] && exec startx > /dev/null 2>&1
fi
