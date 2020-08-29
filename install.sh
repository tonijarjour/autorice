#!/bin/bash

LINKDOT=$PWD

sudo pacman -S ttf-joypixels ttf-croscore noto-fonts-cjk noto-fonts \
    ttf-fantasque-sans-mono rofi maim alacritty exa feh xclip sxhkd \
    bspwm dunst libnotify xorg-server xorg-xinit xorg-xprop fzf mpv \
    pulseaudio-alsa neovim neofetch diff-so-fancy zathura-pdf-mupdf \
    picom sxiv nnn httpie bat ripgrep fd

curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

# Font rendering improvements. Last one enables emoji to display.
sudo ln -sf /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/75-joypixels.conf /etc/fonts/conf.d/

# Screenshots will go in the Captures folder. You can change this in config/sxhkd/sxhkdrc
mkdir -p ~/.config ~/Images/Captures

cd ~
ln -sf $LINKDOT/home/.* .

cd ~/.config
ln -sf $LINKDOT/config/* .

echo "-- Autorice finished!"
