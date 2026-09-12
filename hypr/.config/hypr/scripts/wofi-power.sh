#!/bin/bash

options="Shutdown\nReboot\nLogout\nLock"

choice=$(echo -e "$options" | wofi --dmenu --prompt "Power")

case $choice in
Shutdown) systemctl poweroff ;;
Reboot) systemctl reboot ;;
Logout) hyprctl dispatch exit ;;
Lock) hyprlock ;;
esac
