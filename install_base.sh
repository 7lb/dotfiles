#! /bin/sh

# Enhance perceived desktop performance
sudo echo "vm.swappiness=1" >> /etc/sysctl.d/99-sysctl.conf
sudo echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.d/99-sysctl.conf

# Install common packages
sudo pacman -Sy \
	neovim \
	python-neovim \
	termite \
	ttf-dejavu \
	adobe-source-code-pro-fonts \
	polkit \
	firefox \
	pulseaudio \
	openssh \
	compton

# Create symlinks
mkdir -p ~/.config/nvim
mkdir -p ~/.config/compton
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/compton/compton.conf ~/.config/compton/compton.conf
ln -s ~/.dotfiles/sqliterc ~/.sqliterc

# Install cower and pacaur
# create work dir and clone repos
mkdir __pacaur && cd __pacaur
git clone https://aur.archlinux.org/pacaur.git pacaur
git clone https://aur.archlinux.org/cower.git cower

# get cower pgp key
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53

# build and install cower and pacaur
cd cower && makepkg -sir PKGBUILD
cd ../pacaur && makepkg -sir PKGBUILD

# cd back to home and clean build dir
cd && rm -rf __pacaur

# Install aur packages
pacaur -Sy \
	physlock \
	dmenu2 \
	brightnessctl

# Create additional symlinks
# dmenu helpers
sudo ln -s ~/.dotfiles/dmenu_wrapper /usr/bin/dmenu_wrapper
sudo ln -s ~/.dotfiles/dmenu_term /usr/bin/dmenu_term
sudo ln -s ~/.dotfiles/power_down_helper /usr/bin/power_down_helper

# backlight control
sudo ln -s ~/.dotfiles/90-brightnessctl.rules /lib/udev/rules.d/90-brightnessctl.rules

# Enable locking on suspend
sudo cp ~/.dotfiles/suspend\@.service /etc/systemd/system/suspend\@$USER.service
sudo sed -i "s/<USER_NAME>/$USER/" /etc/systemd/system/suspend\@$USER.service

# Install dein for nvim plugin management
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh dein_installer.sh ~/.config/nvim/dein
rm dein_installer.sh

# Update nvim plugins
nvim -c "call dein#update() | q"
