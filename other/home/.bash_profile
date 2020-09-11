# ~/.bash_profile

# ~/.profile contains environment variables.
[[ -f "$HOME"/.profile ]] && . "$HOME"/.profile

# ~/.bashrc contains settings for the interactive shell.
[[ -f "$HOME"/.bashrc ]] && . "$HOME"/.bashrc

# If you sign in on tty1, startx. Hides the stdout and stderr.
if [ ! "$DISPLAY" ]; then
    [ "$XDG_VTNR" -eq 1 ] && exec startx > /dev/null 2>&1
fi
