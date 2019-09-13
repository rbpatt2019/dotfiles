#!/usr/bin/env bash

# Terminate already running polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar top &
polybar bottom &

# Confirm launch
echo "polybars launched"
