#!/bin/sh

PACMAN='doas pacman -S'
LINKHERE="$PWD"

if ! [ -f "$PWD"/install.sh ]; then
    echo 'Must run in the directory of this script!'
    exit
fi

$PACMAN bat exa fd fzf ripgrep diff-so-fancy neovim neofetch man-db alacritty nnn \
     xclip xorg-server xorg-xinit xorg-xprop xorg-xrandr dunst libnotify lilypond \
     nvidia picom sxhkd alsa-utils zathura-pdf-poppler zathura-cb maim cmus dmenu \
     xorg-xsetroot capitaine-cursors ttf-fantasque-sans-mono transmission-cli gcc \
     noto-fonts noto-fonts-cjk noto-fonts-emoji firefox feh sxiv mpv httpie make \
     fluidsynth soundfont-fluid
     
    
mkdir -p "$HOME"/.config/nnn/plugins "$HOME"/.local/share "$HOME"/.icons/default

# Link my windows hard drive
ln -s /mnt/archive/Home/* "$HOME"

# Put the dotfiles where they belong
ln -sf "$LINKHERE"/home/.* "$HOME"
ln -sf "$LINKHERE"/config/* "$HOME"/.config/

# Default application settings (xdg-open pdfs and images)
ln -s "$LINKHERE"/local/share/applications "$HOME"/.local/share

# Set the default mouse cursor
ln -s other/index.theme "$HOME"/.icons/default

# Turn off mouse acceleration
doas install -Dm 644 other/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/

# Install dwm
git clone https://git.suckless.org/dwm "$HOME"/.mydwm
ln -s "$LINKHERE"/other/config.h "$HOME"/.mydwm
cd "$HOME"/.mydwm
doas make clean install

# Install nnn plugins
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
