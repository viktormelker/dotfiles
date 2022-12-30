#!/usr/bin/env bash
sink=$(pactl list short sinks | awk '{print $2}' | rofi -dmenu -mesg "select default sink")
pactl set-default-sink "$sink"
notify-send "default sink set to: $sink"
