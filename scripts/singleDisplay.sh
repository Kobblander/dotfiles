#!/bin/zsh
xrandr \
    --output eDP1 --mode 1920x1080 \
    --output DP-2 --off \
    --output HDMI1 --auto --left-of eDP1 \
    --output DP-1 --off
