#!/bin/sh

# USB
# xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --mode 3840x2160 --pos 1920x0 --rotate normal --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off

# Displayport
xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-2-1 --primary --mode 3840x2160 --pos 1920x0 --rotate normal --output DP-2-2 --off --output DP-2-3 --off

~/bin/set_dpi.sh 168

