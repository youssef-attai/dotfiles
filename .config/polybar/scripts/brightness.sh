#!/bin/bash

brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
level=$((brightness * 100 / max_brightness))

if [ $level -lt 5 ]; then
    icon=""
elif [ $level -lt 10 ]; then
    icon=""
elif [ $level -lt 15 ]; then
    icon=""
elif [ $level -lt 20 ]; then
    icon=""
elif [ $level -lt 30 ]; then
    icon=""
elif [ $level -lt 40 ]; then
    icon=""
elif [ $level -lt 50 ]; then
    icon=""
elif [ $level -lt 60 ]; then
    icon=""
elif [ $level -lt 70 ]; then
    icon=""
elif [ $level -lt 80 ]; then
    icon=""
elif [ $level -lt 90 ]; then
    icon=""
else
    icon=""
fi

echo "$icon $level%"
