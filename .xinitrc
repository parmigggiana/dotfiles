#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Adjust keyboard typematic delay and rate
xset r rate 225 35

# Start Xorg server at this DPI
xrandr --dpi 96x113

# Sets the italian keyboard layout
setxkbmap it

# Set Wallpaper and theme
feh --bg-fill .wallpaper.png &

# Bluelight
redshift & 

# Service for transparent windows
picom &

# Start i3wm
exec i3

# Start polybar
#exec --no-startup-id polybar PolybarTop -r &
#exec --no-startup-id polybar PolybarBot -r &

#xclock &
#terminator &
#exec terminator -geometry 80x66+0+0 -name login
