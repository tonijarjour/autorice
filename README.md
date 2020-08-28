### Introduction 

![hi](preview.png)

This is an extremely simple autoricer. Here's a list of the programs you get:

* Emoji: Joypixels
* MS Metric fonts: Croscore Fonts
* Unicode: Noto Fonts
* Terminal Font: Fantasque Sans Mono
* Apps Menu: Rofi
* Terminal Emulator: Alacritty
* Text Editor: Neovim
* PDF Reader: Zathura
* Video Player: mpv
* Image Viewer: feh, sxiv
* File Manager: nnn
* Window Manager: bspwm
* Hotkey Manager: sxhkd
* Notifications: dunst
* Search: fzf
* Clipboard: xclip
* Screenshot: maim
* System Info: neofetch
* Compositor: picom

### Installation

1. Install Arch Linux and a graphics driver.
2. `git clone https://github.com/tonijarjour/autorice.git ~/.dotfiles`
3. Edit [`config/bspwm/bspwmrc`](config/bspwm/bspwmrc) and [`config/sxhkd/sxhkdrc`](config/sxhkd/sxhkdrc) to your satisfaction.
4. Check on everything else and change it if you want.
5. `cd ~/.dotfiles` then `bash install.sh` 
6. Reboot when finished.

### Default Applications
I recommend running the following commands after you have booted into the desktop.
* `xdg-mime default org.pwmt.zathura-pdf-mupdf.desktop application/pdf`
* `xdg-mime default feh.desktop image/jpeg`
* `xdg-mime default feh.desktop image/png`
* `xdg-mime default sxiv.desktop image/gif`

### Usage

You can view and change keybinds in the [sxhkd config file](config/sxhkd/sxhkdrc).


### Something doesn't work. 

Open an issue and let me know. 

