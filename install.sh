#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

s() {
  C=''
  for i in "$@"; do 
    i="${i//\\/\\\\}"
    C="$C \"${i//\"/\\\"}\""
  done
  su -c bash -c "$C"
}

s pacman -S fd ripgrep neovim alacritty mpv maim feh sxiv xclip dmenu which \
  ttf-iosevka-nerd ttf-croscore noto-fonts noto-fonts-cjk noto-fonts-emoji \
  xorg-server xorg-xinit xorg-xsetroot zathura-pdf-mupdf zathura-cb fakeroot \
  gcc autoconf automake pkgconf make patch man-db texinfo arc-solid-gtk-theme

echo 'install a fontconfig file that ensures the use of a display friendly arabic font'
s install -Dm 644 "$here/system/arabic.conf" "/etc/fonts/conf.d/66-noto-reject-nastaliq.conf"

git clone "https://github.com/tonijarjour/dwm.git" "$HOME/dwm"
ln -s "$here/system/dwm.h" "$HOME/dwm/config.h"
cd "$HOME/dwm" || exit 1
echo 'compile and install dwm'
s make clean install

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || exit 1
makepkg -si

mkdir -p "$HOME/.config"
ln -sf "$here/config/"* "$HOME/.config/"

for f in "$here/home/"*
do
    ln -sf "$f" "$HOME/.${f##*/}"
done

echo "DONE"
