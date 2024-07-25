#!/usr/bin/env sh
# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
BAR_NAME=kleiner
BAR_CONFIG=$HOME/.config/polybar/config.ini
BAR_NAME2=kleiner2
# BAR_CONFIG2=$HOME/.config/polybar/config2.ini
PRIMARY=$(xrandr --query | grep "eDP-1 connected" | grep "primary" | cut -d" " -f1)
SECONDARY=$(xrandr --query | grep "HDMI-1 connected" | grep -v "primary" | cut -d" " -f1)
# Launch on primary monitor
MONITOR=$PRIMARY polybar --reload -c $BAR_CONFIG $BAR_NAME &
sleep 1
# Launch on secondary monitor
MONITOR=$SECONDAY polybar --reload -c $BAR_CONFIG $BAR_NAME2 &
sleep 1
