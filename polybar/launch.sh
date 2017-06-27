# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

monitorCount=$(xrandr --query | grep ' connected' | wc -l)
echo "${monitorCount}"

# Launch bar1 and bar2
if [ $monitorCount -gt 3 ];
then
    MONITOR=DP-2-1 polybar example &
    MONITOR=DP-1 polybar example &
    MONITOR=DP-2-2 polybar example &
elif [ $monitorCount -eq 1 ];
then
    MONITOR=eDP-1 polybar example &
fi


echo "Bars launched..."
