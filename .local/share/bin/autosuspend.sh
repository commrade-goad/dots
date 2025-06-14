#!/bin/bash

LOCK_TIME=$((5 * 60 * 1000))
SUSPEND_TIME=$((10 * 60 * 1000))

while true; do
    idle=$(xprintidle)

    if [ "$idle" -ge "$SUSPEND_TIME" ]; then
        systemctl suspend
    elif [ "$idle" -ge "$LOCK_TIME" ]; then
        slock
    fi

    sleep 10
done
