## Instructions
### Clone in `~/.dotfiles`
```sh
git clone https://github.com/7lb/dotfiles ~/.dotfiles
```

### Install base system
```sh
~/.dotfiles/install_base.sh
```

### If installing bspwm
```sh
~/.dotfiles/bspwm/install_bspwm.sh
```

### If installing i3: create symlinks
```sh
ln -s ~/.dotfiles/i3/fish ~/.config/fish  
ln -s ~/.dotfiles/i3/i3 ~/.config/i3  
ln -s ~/.dotfiles/i3/xinitrc ~/.xinitrc  
ln -s ~/.dotfiles/i3/Xresources ~/.Xresources  
ln -s ~/.dotfiles/i3/xbindkeysrc ~/.xbindkeysrc  
ln -s ~/.dotfiles/i3/rtorrent.rc ~/.rtorrent.rc
```
