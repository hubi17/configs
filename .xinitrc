#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

# Enable numlock by default
numlockx &

#if [ -f ~/.Xmodmap ]; then
#	xmodmap ~/.Xmodmap
#fi

# Disable capslock and set it to escape
setxkbmap -option caps:escape

# Disable screen blacking after inactivity
xset -dpms
xset s off

# Enable fonts in /usr/share/fonts/local
xset +fp /usr/share/fonts/local
xset fp rehash

# Enable .Xresources parsing
xrdb -merge ~/.Xresources

# Determine how to start awesomewm.
# full starts with autorun of applications on. zenburn theme. custom wallpaper
# slim starts with autorun of applications off. sky theme. default wallpaper
# default is to start awesomewm normally.
if [[ $1 == "full" ]]
then
	exec awesome -c ~/.config/awesome/fullrc.lua
elif [[ $1 == "slim" ]]
then
	exec awesome -c ~/.config/awesome/slimrc.lua
elif [[ $1 == "nbg" ]]
then
	exec awesome -c ~/.config/awesome/nbgrc.lua
else
	exec awesome
fi
