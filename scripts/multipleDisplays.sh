#!/bin/zsh
xrandr  \
    --output DP-2-1 --mode 1920x1080 \
    --output DP-1 --auto --left-of DP-2-1 --rotate left\
    --output DP-2-2 --auto --left-of DP-1 --rotate left\
