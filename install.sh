#!/bin/sh

PACMAN='sudo pacman -S'
LINKHERE="$PWD"

# This needs to be run from the directory that contains it to properly link the files.
if ! [ -f "$PWD"/install.sh ]; then
    echo 'Must run in the directory of this script!'
    exit
fi

$PACMAN alacritty alsa-utils bat bspwm capitaine-cursors cmus diff-so-fancy \
        dunst exa fd feh fzf httpie libnotify maim man-db mpv neofetch neovim \
        nnn noto-fonts noto-fonts-cjk noto-fonts-emoji picom ripgrep rofi sxhkd \
        sxiv xclip xorg-server xorg-xinit xorg-xprop xorg-xrandr xorg-xsetroot \
        zathura-pdf-mupdf
    
# Make the needed directories for this script to succeed.
mkdir -p "$HOME"/.config/nnn/plugins "$HOME"/.local/share "$HOME"/.icons/default

# Put the dotfiles where they belong
ln -sf "$LINKHERE"/home/.* "$HOME"
ln -sf "$LINKHERE"/config/* "$HOME"/.config/

# Default application settings (xdg-open pdfs and images)
ln -s "$LINKHERE"/local/share/applications "$HOME"/.local/share

# Set the defeault mouse cursor
cp other/index.theme "$HOME"/.icons/default

# Install nnn plugins
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
