#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

doas pacman -S base-devel man-db ripgrep fd neovim alacritty mpv maim xclip \
    ttf-iosevka-nerd ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji \
    xorg-server xorg-xinit xorg-xsetroot dmenu zathura-pdf-mupdf zathura-cb feh

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || exit 1
makepkg -si

git clone "https://aur.archlinux.org/nsxiv.git" "$HOME/nsxiv"
cd "$HOME/nsxiv" || exit 1
makepkg -si

mkdir -p "$HOME/.config"
ln -sf "$here/config/"* "$HOME/.config/"

for f in "$here/home/"*
do
    ln -sf "$f" "$HOME/.${f##*/}"
done

echo "DONE"
