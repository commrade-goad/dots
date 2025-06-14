#!/usr/bin/env bash

status=$(eww active-windows | awk '{print$2}')
if [ "$status" = "bar" ]; then
    eww close bar
else
    eww open bar
fi
