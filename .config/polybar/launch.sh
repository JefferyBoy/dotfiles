#!/usr/bin/env bash

# Add this script to your wm startup file.

# DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
primaryMonitor=$(xrandr --listactivemonitors | grep "+\*" | cut -d ' ' -f 6)
bookMonitor="DP-4"
polybar -q main &
if [ ! "$primaryMonitor" = "$bookMonitor" ]; then
  sleep 2
  polybar -q "$bookMonitor" &
fi
