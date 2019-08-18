#!/bin/sh

# Export the path to this directory for later use in the script
export LINKDOT=$PWD

# Install fonts and programs. Including two WMs, a terminal emulator
# App launcher, screenshot tool, pdf viewer, image viewer, and text editor.
sudo pacman -S ttf-joypixels ttf-croscore noto-fonts-cjk noto-fonts \
    ttf-fantasque-sans-mono ttf-linux-libertine rofi mpv maim exa \
    alacritty alacritty-terminfo compton neofetch dash neovim xclip \
    feh sxhkd bspwm i3-gaps dunst zathura-pdf-mupdf libnotify \
    diff-so-fancy zsh-autosuggestions zsh-syntax-highlighting \
    xorg-server xorg-xinit xorg-xprop pulseaudio-alsa

read -p "-- Would you like to use mpd + ncmpcpp instead of cmus? [y/N] " yna
case $yna in
    [Yy]* ) sudo pacman -S mpd ncmpcpp
        patch home/.xinitrc < other/add-mpd.patch
        ;;
    * ) sudo pacman -S cmus;;
esac

# Optionally install some more programs. Including a file manager,
# find, cat, grep, and curl replacements. And a powerful image viewer.
read -p "-- Would you like to install some extras? (Powerful command-line tools) [Y/n] " ynb
case $ynb in
    ''|[Yy]* ) sudo pacman -S nnn fd bat ripgrep httpie sxiv fzf
        patch home/.zshrc < other/add-fzf.patch
        ;;
    * ) echo "-- Extras Skipped";;
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

# Make some folders. Screenshots will go in the captures folder.
mkdir -p ~/.config ~/.aurpkgs ~/Images/Captures ~/Images/Wallpapers \
    $LINKDOT/config/mpd/playlists ~/Music

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

echo "-- Installation Complete! Restart the computer."
