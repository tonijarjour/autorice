#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

prompt() { printf "=> "; su -c bash -c "$@"; }

echo "Install programs with pacman"
prompt \
 "pacman -S fd ripgrep neovim alacritty mpv maim feh sxiv xclip dmenu which \
  ttf-iosevka-nerd ttf-croscore noto-fonts noto-fonts-cjk noto-fonts-emoji \
  xorg-server xorg-xinit xorg-xsetroot zathura-pdf-mupdf zathura-cb patch gcc \
  arc-solid-gtk-theme man-db texinfo fakeroot autoconf automake pkgconf make"

git clone "https://github.com/tonijarjour/dwm.git" "$HOME/dwm"
ln -s "$here/system/dwm.h" "$HOME/dwm/config.h"
cd "$HOME/dwm" || exit 1
echo "Compile and install dwm"
prompt "make clean install"

echo "Reject Noto Nastaliq Urdu font"
prompt "install -Dm 644 \"$here/system/arabic.conf\" \"/etc/fonts/conf.d/66-noto-reject-nastaliq.conf\""

mkdir -p "$HOME/.config"
ln -sf "$here/config/"* "$HOME/.config/"

for f in "$here/home/"*
do
  ln -sf "$f" "$HOME/.${f##*/}"
done

echo "DONE"
