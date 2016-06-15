# Auto-mount daemon
sudo ldm -d -u l &

# Keyboard
setxkbmap gb &
xset r rate 180 &
xbindkeys -p &

# Background
feh --bg-fill ~/walls/wallhaven-52892.jpg &

# Touchpad
synclient HorizScrollDelta=10 &
synclient VertScrollDelta=50 &
synclient HorizEdgeScroll=1 &
synclient TapButton2=3 &
synclient TapButton3=2 &

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
export QT_STYLE_OVERRIDE=GTK+

exec i3
