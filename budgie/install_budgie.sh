#! /bin/sh

sudo pacman -Sy \
    budgie-desktop \
    gnome \
    network-manager-applet \
    gnome-screensaver \
    gnome-tweak-tool \
    arc-gtk-theme \
    arc-icon-theme

sudo pacman -Rnds \
    empathy \
    epiphany \
    gnome-contacts \
    gnome-dictionary \
    gnome-terminal \
    gnome-user-docs \
    gnome-font-viewer \
    gnome-system-monitor \
    gnome-disk-utility \
    gucharmap \
    sushi \
    evince \
    eog \
    vino \
    yelp \
    grilo-plugins \
    totem \
    tracker

systemctl enable NetworkManager.service
