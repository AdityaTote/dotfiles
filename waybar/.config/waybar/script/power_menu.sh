#!/bin/bash

# Power menu script for Waybar
# Shows a popup menu with shutdown, reboot, and sleep options

# Debug log
LOG_FILE="/tmp/waybar_power_menu.log"
echo "$(date): Script started" >> "$LOG_FILE"
echo "WAYLAND_DISPLAY: $WAYLAND_DISPLAY" >> "$LOG_FILE"
echo "DISPLAY: $DISPLAY" >> "$LOG_FILE"

options="Shutdown\nReboot\nSleep\nCancel"

# Try wofi first (better for Wayland/Hyprland), fallback to rofi
if command -v wofi &> /dev/null; then
    echo "$(date): Using wofi" >> "$LOG_FILE"
    chosen=$(echo -e "$options" | wofi --dmenu --prompt "Power Menu" --width 250 --height 220 2>> "$LOG_FILE")
    echo "$(date): Selected: $chosen" >> "$LOG_FILE"
elif command -v rofi &> /dev/null; then
    echo "$(date): Using rofi" >> "$LOG_FILE"
    chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -i 2>> "$LOG_FILE")
    echo "$(date): Selected: $chosen" >> "$LOG_FILE"
else
    # Fallback to zenity if available
    if command -v zenity &> /dev/null; then
        echo "$(date): Using zenity" >> "$LOG_FILE"
        chosen=$(zenity --list --title="Power Menu" --column="Options" "Shutdown" "Reboot" "Sleep" "Cancel" 2>> "$LOG_FILE")
        echo "$(date): Selected: $chosen" >> "$LOG_FILE"
    else
        # Last resort: use notify-send to show error
        echo "$(date): No menu program found!" >> "$LOG_FILE"
        command -v notify-send &> /dev/null && notify-send "Power Menu Error" "No menu program found (wofi, rofi, or zenity required)"
        exit 1
    fi
fi

# Handle empty selection (user pressed Escape or clicked away)
if [[ -z "$chosen" ]]; then
    echo "$(date): Empty selection, exiting" >> "$LOG_FILE"
    exit 0
fi

echo "$(date): Executing action for: $chosen" >> "$LOG_FILE"

case "$chosen" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Sleep)
        systemctl suspend
        ;;
    Cancel|*)
        exit 0
        ;;
esac
