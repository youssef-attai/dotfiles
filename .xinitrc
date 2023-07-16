setxkbmap -layout us,ara &
picom --no-vsync &
clipmenud &
dunst &
mpd &
mpDris2 &
playerctld &
feh --bg-scale --zoom fill "$PICTURES_DIR/bg.png" &
battery_notifier &
charger_sound &
exec i3
