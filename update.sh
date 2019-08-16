#!/bin/sh

cd ~/.aurpkgs/polybar
git pull
makepkg -si

cd ../oh-my-zsh-git
git pull
makepkg -si

sudo pacman -Syyu
