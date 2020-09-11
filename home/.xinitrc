#!/bin/sh
# ~/.xinitrc

userresources="$HOME"/.Xresources
usermodmap="$HOME"/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f "$sysresources" ]; then
    xrdb -merge "$sysresources"
fi

if [ -f "$sysmodmap" ]; then
    xmodmap "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Uncomment for international letters through Right Alt.
#setxkbmap -layout us -variant altgr-intl -option nodeadkeys

# Uncomment if you would like to use caps lock as super.
#setxkbmap -option caps:super

# Sets left pointer as the default shape for the desktop.
xsetroot -cursor_name left_ptr

# bspwm is configured in ~/.config/bspwm/bspwmrc
exec bspwm
