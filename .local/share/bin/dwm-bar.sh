#!/bin/sh

while true; do
    DATE=$(date "+%d/%m/%Y")
    TIME=$(date "+%H:%M")

    # Change BAT0 to your battery device if different
    BAT_PATH_CAP="/sys/class/power_supply/BAT1/capacity"
    BAT_PATH_STAT="/sys/class/power_supply/BAT1/status"
    if [ -f "$BAT_PATH_CAP" ]; then
        BAT=$(cat "$BAT_PATH_CAP")
    else
        BAT="N/A"
    fi

    if [ -f "$BAT_PATH_STAT" ]; then
        BAT="$BAT%"
        if [ "$(cat $BAT_PATH_STAT)" = "Charging" ]; then
            BAT="$BAT+"
        fi
    fi

    xsetroot -name " BAT : $BAT  |  $TIME - $DATE  | "
    sleep 30
done

