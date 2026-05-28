#!/usr/bin/env bash

step=10%
device_class=backlight

case "${1:-}" in
    up)
        brightnessctl -c "$device_class" set "${step}+"
        ;;
    down)
        brightnessctl -c "$device_class" set "${step}-"
        ;;
    *)
        echo "usage: $0 up|down" >&2
        exit 1
        ;;
esac

pct=$(brightnessctl -c "$device_class" -m | cut -d, -f4)
dunstify -r 1001 -a brightness "$pct" Brightness
