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

setxkbmap -layout us -variant altgr-intl -option nodeadkeys
setxkbmap -option caps:super
xsetroot -cursor_name left_ptr
feh --bg-fill --no-fehbg --randomize "$HOME"/Images/Wallpapers/7.png
sh "$HOME"/.date.sh &
pgrep -x picom > /dev/null || picom --config /dev/null --backend glx \
	--glx-no-stencil --glx-no-rebind-pixmap --experimental-backends \
	--xrender-sync-fence --use-damage --vsync &
pgrep -x sxhkd > /dev/null || sxhkd -c "$HOME"/.config/sxhkd/dwmsxh &
exec dwm
