#!/bin/zsh
xrandr  \
    --output DP2-2 --auto  \
    --output DP1 --auto --left-of DP2-2 --rotate left\
    --output DP2-1 --mode 1920x1080 --left-of DP1 --rotate left\
