#!/usr/bin/env bash

interval=600
if [ ! -z "$1" ]; then
    T=$1
    interval=$((T * 60))
fi

echo "Will notify every $((interval / 60)) minute(s)"

trap "echo; exit 130" sigint

while [ true ]; do
    sleep $interval
    date +%H:%M
    mpv \
        --no-video \
        --no-keep-open \
        /usr/share/sounds/freedesktop/stereo/dialog-warning.oga \
        --ab-loop-a=0 \
        --ab-loop-b=100000 \
        --ab-loop-count=10 \
        $1 \
        >/dev/null 2>&1
done
