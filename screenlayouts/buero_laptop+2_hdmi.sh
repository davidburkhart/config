#!/bin/sh

# xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP2-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP2-2 --mode 1920x1080 --pos 3840x0 --rotate left --output DP2-3 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off

# xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP2-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP2-1 --primary --mode 1920x1080 --pos 3840x0 --rotate left


xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal
xrandr --output DP2-2 --mode 1920x1080 --pos 1920x0 --rotate normal --primary
xrandr --output DP2-1 --mode 1920x1080 --pos 3840x0 --rotate left
xrandr --output DP1 --off
xrandr --output DP2 --off
xrandr --output DP2-3 --off
xrandr --output HDMI1 --off
xrandr --output HDMI2 --off
xrandr --output VIRTUAL1 --off