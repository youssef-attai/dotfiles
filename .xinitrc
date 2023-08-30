dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

setxkbmap -layout us,ara &
clipmenud &
dunst &
mpd &
mpDris2 &
playerctld &
battery_notifier &
charger_sound &
exec i3
