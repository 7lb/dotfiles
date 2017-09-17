#! /bin/sh

# install packages
sudo pacman -Sy bspwm sxhkd xorg-server xorg-xinit xorg-xset xorg-xinput

mkdir -p ~/.config/bspwb
ln -s ~/.dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/bspwm/sxhkdrc ~/.config/bspwm/sxhkdrc
ln -s ~/.dotfiles/bspwm/xinitrc ~/.xinitrc
