#!/bin/bash

# Defaults
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Alt+Shift to change keyboard layout
setxkbmap -layout us,ru
setxkbmap -option 'grp:alt_shift_toggle'

# Swap caps and escape
setxkbmap -option caps:escape

# Turn off backlight
PLATFORM=$(cat /sys/class/dmi/id/product_name)
[[ "$PLATFORM" == "MS-7C94" ]] && g413-led -a 000000

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Start Qtile
exec qtile start
