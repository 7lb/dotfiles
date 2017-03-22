## Instructions
### Clone in `~`
```sh
git clone git@github.com:7lb/dotfiles.git ~/.dotfiles
```

### Create symlinks
```sh
ln -s ~/.dotfiles/compton ~/.config/compton  
ln -s ~/.dotfiles/fish ~/.config/fish  
ln -s ~/.dotfiles/i3 ~/.config/i3  
ln -s ~/.dotfiles/nvim ~/.config/nvim  
ln -s ~/.dotfiles/xinitrc ~/.xinitrc  
ln -s ~/.dotfiles/Xresources ~/.Xresources  
ln -s ~/.dotfiles/xbindkeysrc ~/.xbindkeysrc  
ln -s ~/.dotfiles/rtorrent.rc ~/.rtorrent.rc
ln -s ~/.dotfiles/sqliterc ~/.sqliterc
```

### Copy dmenu wrapper to /usr/bin
```sh
sudo cp ~/.dotfiles/dmenu_term /usr/bin  
```

### Enhance perceived desktop performance
```sh
sudo echo "vm.swappiness=1" >> /etc/sysctl.d/99-sysctl.conf  
sudo echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.d/99-sysctl.conf
```

### Install dein for nvim plugin management
```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh  
cat installer.sh | less  
sh installer.sh ~/.config/nvim/dein  
rm installer.sh
```

### Update nvim plugins
```sh
nvim -c "call dein#update() | q"
```
