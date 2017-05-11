# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
MONITOR=eDP-1 polybar example &
MONITOR=DP-1 polybar example &
MONITOR=DP-2-2 polybar example &

echo "Bars launched..."
