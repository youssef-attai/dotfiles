#!/bin/bash

# If $1 is not passed or is passed as "date", print time, else print date
if [ -z "$1" ] || [ "$1" == "time" ]; then
    date=$(date +"%l:%M %p" | sed 's/^ //')
    echo $date
elif [ "$1" == "date" ]; then
    time=$(date +"%A, %B %d, %Y" | sed 's/^ //')
    echo $time
fi

