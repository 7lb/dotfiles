## Instructions
### Clone in ~
```sh
cd  
git clone git@github.com:7lb/dotfiles.git
```

### Create symlinks in `$XDG_CONFIG`
```sh
ln -s ~/.dotfiles/compton ~/.config/compton  
ln -s ~/.dotfiles/fish ~/.config/fish  
ln -s ~/.dotfiles/i3 ~/.config/i3  
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/xinitrc ~/.xinitrc
ln -s ~/.dotfiles/Xresources ~/.Xresources
ln -s ~/.dotfiles/xbindkeysrc ~/.xbindkeysrc
```

### Install dein for nvim plugin management
```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh  
cat installer.sh | less  
sh installer.sh .config/nvim/dein
```

### Update nvim plugins
```sh
nvim -c "call dein#update() | q"
```
