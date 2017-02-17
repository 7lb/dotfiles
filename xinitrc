# Auto-mount daemon
sudo ldm -d -u l &

# Keyboard
setxkbmap gb &
xset r rate 180 &
xbindkeys -p &

# Background
feh --bg-fill ~/walls/wallhaven-132205.jpg &

# Touchpad
# Enable tapping
xinput set-prop "ETPS/2 Elantech Touchpad" 273 1 &
# Enable drag lock
xinput set-prop "ETPS/2 Elantech Touchpad" 277 1 &

# Screen
xset -dpms &
xset s 300 300 &
xss-lock physlock &

# Terminal
urxvtd -q -o -f &
export TERMINAL=urxvtc &
xrdb ~/.Xresources &

# Compositor
compton --config ~/.config/compton/compton.conf -b

# Make Qt 5 apps look and feel the same as gtk+ ones
export QT_STYLE_OVERRIDE='gtk2'

exec i3
