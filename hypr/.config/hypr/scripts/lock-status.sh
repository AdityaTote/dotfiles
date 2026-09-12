#!/bin/sh

case "$1" in
  battery)
    printf '<span foreground="darkseagreen">BAT</span> <span foreground="palegreen">%s%%  %s</span>\n' "$(cat /sys/class/power_supply/BAT0/capacity)" "$(cat /sys/class/power_supply/BAT0/status)"
    ;;
  network)
    network=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi | awk -F: '$1 == "yes" { printf "%s %s%%", $2, $3; exit }')
    printf '<span foreground="darkseagreen">NET</span> <span foreground="palegreen">%s</span>\n' "${network:-offline}"
    ;;
  media)
    media=$(playerctl metadata --format '{{status}}  {{artist}} - {{title}}' 2>/dev/null)
    [ -n "$media" ] || exit 0
    printf '<span foreground="darkseagreen">MEDIA</span> <span foreground="palegreen">%s</span>\n' "$media"
    ;;
  system)
    printf '<span foreground="darkseagreen">HOST</span> <span foreground="palegreen">%s  |  %s</span>\n' "$(hostnamectl --static)" "$(uptime -p | sed 's/^up //')"
    ;;
  notifications)
    count=$(swaync-client -c 2>/dev/null)
    printf '<span foreground="darkseagreen">NOTIFS</span> <span foreground="palegreen">%s</span>\n' "${count:-0}"
    ;;
esac
