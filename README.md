![hi](screenshot.png)

### Introduction 

Need a serviceable Arch setup *fast*? Perhaps wishing for a solid base to customize from? Seeking social proof and attention? Trying to impress your parents?

**The AUTORICE 9001 has got you covered.**

### Installation

This little script will install a collection of command line tools, two window managers, and a terminal emulator. Installation is easy:

1. Install Arch Linux and a graphics driver for your system.
2. `sudo pacman -S base-devel git` Skip if you already have these.
3. `git clone https://github.com/tonijarjour/autorice.git .dotfiles`
4. `cd .dotfiles` (You **must** be inside the cloned directory)
5. `sh install.sh`
6. Restart your computer after the script finishes.

### Usage

This script does nothing past providing you with dotfiles for the programs it installs. There is no universal config file, nor a master settings panel. Its up to you to configure and learn everything you need.

With that said. There are some important aspects that should give some comfort:

1. Everything is *nearly* default. 
2. No magic. The dotfiles are organized in the simplest and most logical structure possible. 
3. Theres not much here. You can look through everything in about an hour. 
4. Two window managers: bspwm (tty1) and i3 (tty2) to fit most preferences. 

With those three points laid out, here are some basic keybindings to help you out:

* `mod return` to start a Terminal.
* `mod space` to use the app launcher.
* `mod h,j,k,l` to move between windows.
* `mod 1,2,3...` to move between workspaces.
* `mod shift h,j,k,l` to swap window positions.
* `mod shift 1,2,3...` to send a window to a workspace.
* `mod alt q` to quit out of bspwm.
* `mod shift e` to quit out of i3.
* `printscreen` to take a screenshot.

### Something doesn't work. 

**Please** open an issue and tell me what happened. My goal is to make this work for everyone and that starts with fixing every little problem people have.

