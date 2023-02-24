#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

sudo pacman -S base-devel man-db ripgrep fd neovim alacritty mpv maim xclip \
    ttf-iosevka-nerd ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji \
    xorg-server xorg-xinit xorg-xsetroot dmenu zathura-pdf-mupdf zathura-cb \
    feh sxiv

git clone "https://github.com/tonijarjour/dwm.git" "$HOME/dwm"
ln -s "$here/dwm.h" "$HOME/dwm/config.h"
cd "$HOME/dwm" || exit 1
sudo make clean install

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || exit 1
makepkg -si

mkdir -p "$HOME/.config"
ln -sf "$here/config/"* "$HOME/.config/"

for f in "$here/home/"*
do
    ln -sf "$f" "$HOME/.${f##*/}"
done

doas install -Dm 644 "$here/arabic.conf" \
  "/etc/fonts/conf.d/66-noto-reject-nastaliq.conf"

echo "DONE"
