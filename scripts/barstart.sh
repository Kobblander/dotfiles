#!/usr/bin/env bash

. $HOME/.config/admiral.d/config

pkill admiral &>/dev/null
pkill lemonbar &>/dev/null

MONITORCOUNT=$(xrandr -q | grep " connected" | wc -l)
DIMENSIONS=$(xrandr -q | grep " connected" | awk '{print $4}')
LEMONBARCOMMAND='lemonbar -f "$FONT1" -f "$FONT2" -f "Siji-7" -f "Symbola-8"  -B "#FF002b36" -F "#FF93a1a1" -u 3 -p | sh'
echo $MONITORCOUNT
echo $DIMENSIONS

if [ "$MONITORCOUNT" == "1" ]
then
    echo singlemonitor
    $HOME/.local/bin/admiral -c $ADMIRAL_HOME/admiral.toml.single | eval $LEMONBARCOMMAND
elif [ "$MONITORCOUNT" == "2" ]
then
    echo doublemonitor
    $HOME/.local/bin/admiral -c $ADMIRAL_HOME/admiral.toml.double | eval $LEMONBARCOMMAND
elif [ "$MONITORCOUNT" == "3" ]
then
    echo triplemonitor
    $HOME/.local/bin/admiral -c $ADMIRAL_HOME/admiral.toml.triple | eval $LEMONBARCOMMAND
fi


#echo "%{S0}foobar%{S1}foobar" | lemonbar -f "$FONT1" -f "$FONT2" -f "Siji-7" -f "Symbola-8"  -B "#FF002b36" -F "#FF93a1a1" -u 3 -p -d
#$HOME/.local/bin/admiral | sed -e 's/^/%{S1}/' | lemonbar -f "$FONT1" -f "$FONT2" -f "Siji-7" -f "Symbola-8"  -B "#FF002b36" -F "#FF93a1a1" -u 3 -p -d
#$HOME/.local/bin/admiral -c ~/.config/admiral.d/admiralDP1.toml | lemonbar -g 1200x25+1920+0 -f "$FONT1" -f "$FONT2" -f "Siji-7" -f "Symbola-8"  -B "#FF002b36" -F "#FF93a1a1" -u 3 -p -d | sh &
#$HOME/.local/bin/admiral -c ~/.config/admiral.d/admiralDP2.toml | lemonbar -g 1920x25+3120+0 -f "$FONT1" -f "$FONT2" -f "Siji-7" -f "Symbola-8"  -B "#FF002b36" -F "#FF93a1a1" -u 3 -p -d | sh &
