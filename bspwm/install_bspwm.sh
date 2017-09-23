#! /bin/sh

# install packages
sudo pacman -Sy \
	bspwm \
	sxhkd \
	xorg-server \
	xorg-xinit \
	xorg-xset \
	xorg-setxkbmap \
	xorg-xinput \
	compton

pacaur -Sy \
	yabar-git \
	ttf-font-awesome

mkdir -p ~/.config/bspwm
mkdir -p ~/.config/compton
mkdir -p ~/.config/yabar
ln -s ~/.dotfiles/bspwm/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/bspwm/bspwm/sxhkdrc ~/.config/bspwm/sxhkdrc
ln -s ~/.dotfiles/compton/compton.conf ~/.config/compton/compton.conf
ln -s ~/.dotfiles/bspwm/yabar/yabar.conf ~/.config/bspwb/yabar/yabar.conf
ln -s ~/.dotfiles/bspwm/xinitrc ~/.xinitrc
