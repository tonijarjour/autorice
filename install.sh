#!/bin/bash

LINKDOT=$PWD

sudo pacman -S ttf-joypixels ttf-croscore noto-fonts-cjk noto-fonts \
    ttf-fantasque-sans-mono rofi maim alacritty exa feh xclip sxhkd \
    bspwm dunst libnotify xorg-server xorg-xinit xorg-xprop fzf mpv \
    pulseaudio-alsa neovim neofetch diff-so-fancy zathura-pdf-mupdf

# Uncomment if you want some cool command line tools.
# sudo pacman -S httpie nnn bat ripgrep fd

# Uncomment if you want to improve font display.
# sudo ln -sf /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
# sudo ln -sf /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
# sudo ln -sf /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/75-joypixels.conf /etc/fonts/conf.d/

xdg-mime default feh.desktop image/png
xdg-mime default feh.desktop image/jpeg
xdg-mime default sxiv.desktop image/gif
xdg-mime default org.pwmt.zathura-pdf-mupdf.desktop application/pdf

mkdir -p ~/.config ~/Images/Captures

cd ~
ln -sf $LINKDOT/home/.* .

cd ~/.config
ln -sf $LINKDOT/config/* .

echo "-- Autorice finished!"
