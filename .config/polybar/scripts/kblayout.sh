#!/usr/bin/env bash

on_off=$(xset -q | grep Group | awk '{print $4}')

if [ "$on_off" = "on" ]
then
  echo "AR"
elif [ "$on_off" = "off" ]
then
  echo "US"
else
  notify-send "Something went wrong with polybar" "Your custom kblayout.sh script is not working as expected" -u critical
fi
