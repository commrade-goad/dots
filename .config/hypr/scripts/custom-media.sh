#!/usr/bin/env sh

empty="No media"

TITLE_MAX_LENGTH=30
ARTIST_MAX_LENGTH=15

while :
do
    sleep 0.5
    status=$(playerctl status 2> /dev/null)

    if [ $? -eq 1 ]; then
        echo -e "$empty"
        continue
    fi

    title=$(playerctl metadata xesam:title 2> /dev/null)
    artist=$(playerctl metadata xesam:artist 2> /dev/null)

    title=$(echo "$title" | awk -v max="$TITLE_MAX_LENGTH" '{print substr($0, 1, max)}')
    artist=$(echo "$artist" | awk -v max="$ARTIST_MAX_LENGTH" '{print substr($0, 1, max)}')

    status_msg="<i>[$status]</i> "

    msg="$status_msg $title - $artist"

    echo -e "$msg"
done
