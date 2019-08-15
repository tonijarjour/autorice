#!/bin/sh

# Export the path to this directory for later use in the script
export LINKDOT=$PWD

# Install fonts and programs. Including two WMs, a terminal emulator
# App laucnher, screenshot tool, pdf viewer, music daemon and player,
# Text editor, image viewer, notification daemon, and several others.
sudo pacman -S ttf-joypixels ttf-croscore noto-fonts-cjk noto-fonts \
    ttf-fantasque-sans-mono ttf-linux-libertine rofi mpv fzf maim \
    alacritty alacritty-terminfo compton mpd neofetch dash neovim \
    ncmpcpp feh xclip sxhkd bspwm i3-gaps dunst zathura-pdf-mupdf \
    diff-so-fancy zsh-autosuggestions zsh-syntax-highlighting exa \
    xorg-server xorg-xinit xorg-xprop pulseaudio-alsa libnotify

# Optionally install some more programs. Including a file manager,
# find, cat, grep, and curl replacements. And a powerful image viewer.
read -p "Would you like to install some extras? (Powerful command-line tools) [Y/n] " yn
case $yn in
    ''|[Yy]* ) sudo pacman -S nnn fd bat ripgrep httpie sxiv;;
    * ) echo "Extras Skipped";;
esac

# Link dash to /bin/sh for performance boost.
# Then link several font config files for better font display.
sudo ln -sfT dash /usr/bin/sh
sudo ln -sf /etc/fonts/conf.avail/75-joypixels.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/

# Misc but important. The last disables mouse acceleration and can be removed.
sudo install -Dm 644 other/freetype2.sh /etc/profile.d/
sudo install -Dm 644 other/local.conf /etc/fonts/
sudo install -Dm 644 other/dashbinsh.hook /usr/share/libalpm/hooks/
sudo install -Dm 644 other/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/

# Make several folders, including a Music and Images folder.
mkdir -p $LINKDOT/config/mpd/playlists \
    ~/.config ~/.aurpkgs ~/Music \
    ~/Images/Captures ~/Images/Wallpapers

# Move provided wallpapers to the wallpapers folder
mv -n wallpapers/* ~/Images/Wallpapers

# Clone the aur packages being installed. Polybar and Oh-My-Zsh
git clone https://aur.archlinux.org/oh-my-zsh-git.git ~/.aurpkgs/oh-my-zsh-git
git clone https://aur.archlinux.org/polybar.git ~/.aurpkgs/polybar

# Install them
cd ~/.aurpkgs/oh-my-zsh-git
makepkg -si
cd ~/.aurpkgs/polybar
makepkg -si

# Link all dotfiles into their appropriate locations
cd ~
ln -sf $LINKDOT/home/.* .

cd ~/.config
ln -sf $LINKDOT/config/* .

echo "Installation Complete! Restart the computer."
