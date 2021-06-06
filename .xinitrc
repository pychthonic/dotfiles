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

# Compositor
picom -f &

# Wifi:
# sudo netctl start my_profile &

xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x2160 --rotate normal --output eDP-1-2 --off --output HDMI-1-1 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off
# xrandr --output HDMI-1-1 --auto --pos 0x0 &
# xrandr --output eDP-1 --auto --pos 1920x2160 &
# 2nd monitor:
# VPN:
mullvad-vpn &

# Wallpaper
nitrogen --restore &

# exec i3

exec qtile start
