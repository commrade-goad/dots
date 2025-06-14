#!/bin/sh
mkdir -p "`xdg-user-dir PICTURES`" && FILE="$(xdg-user-dir PICTURES)/$(date +%m-%d-%Y-%H%M%S).png" && scrot "$FILE" --select --line mode=edge && xclip -selection clipboard -t image/png -i "$FILE"
