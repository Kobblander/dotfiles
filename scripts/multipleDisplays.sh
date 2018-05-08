#!/bin/zsh

monitorOne=eDP-1-1
monitorTwo=DP-1-1
monitorThree=DP-1-2-1


monitorCount=$(xrandr --query | grep ' connected' | wc -l)
echo "${monitorCount}"

if [ $monitorCount -eq 3 ];
then
xrandr \
    --output $monitorOne --mode 1920x1080 --left-of $monitorTwo \
    --output $monitorTwo --left-of $monitorThree \
    --output $monitorThree --auto
elif [ $monitorCount -eq 2 ];
then
xrandr  \
    --output $monitorOne --mode 1920x1080 --left-of $monitorTwo \
    --output $monitorTwo  \

elif [ $monitorCount -eq 1 ];
then
xrandr \
    --output $monitorOne --mode 1920x1080 \
    --output $monitorTwo --off \
    --output $monitorThree --off
fi
