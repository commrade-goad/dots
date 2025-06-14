#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING=1

hsetroot -fill ~/Downloads/129183437_p0.jpg &
xset r rate 300 25 &
setxkbmap -option caps:escape &
picom &
dwm-bar.sh &
nm-applet &
~/.local/share/bin/battrem &
playerctld &
/usr/lib/hyprpolkitagent/hyprpolkitagent &
dunst &

xset s 300 5
xset +dpms
xss-lock -- slock &
autosuspend.sh &

exec dbus-launch dwm
