# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

monitorOne=eDP-1-1
monitorTwo=DP-1-1
monitorThree=DP-1-2-1


monitorCount=$(xrandr --query | grep ' connected' | wc -l)
echo "${monitorCount}"

# Launch bar1 and bar2
if [ $monitorCount -eq 3 ];
then
    MONITOR=$monitorOne polybar example &
    MONITOR=$monitorTwo polybar example &
    MONITOR=$monitorThree polybar example &
elif [ $monitorCount -eq 2 ];
then
    MONITOR=eDP1 polybar example &
    MONITOR=HDMI1 polybar example &
elif [ $monitorCount -eq 1 ];
then
    MONITOR=$monitorOne polybar example &
fi


echo "Bars launched..."
