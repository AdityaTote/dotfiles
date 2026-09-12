#!/bin/bash

case "$1" in
	status)
		if bluetoothctl show | grep -q 'Powered: yes'; then
			printf '%s\n' '{"text":"󰂯","class":"enabled","tooltip":"Bluetooth enabled\\nLeft: devices  •  Right: turn off"}'
		else
			printf '%s\n' '{"text":"󰂲","class":"disabled","tooltip":"Bluetooth disabled\\nLeft: devices  •  Right: turn on"}'
		fi
		;;
	toggle)
		if bluetoothctl show | grep -q 'Powered: yes'; then
			if ! bluetoothctl power off; then
				notify-send -u critical -a Waybar "Bluetooth error" "Could not power off the controller"
				exit 1
			fi
			sleep 1
			rfkill block bluetooth
			message="Bluetooth disabled"
		else
			rfkill unblock bluetooth
			sleep 1
			bluetoothctl power on || {
				sleep 1
				if ! bluetoothctl power on; then
					notify-send -u critical -a Waybar "Bluetooth error" "Could not unblock and power on the controller"
					exit 1
				fi
			}
			message="Bluetooth enabled"
		fi

		command -v notify-send >/dev/null 2>&1 && notify-send -a Waybar "$message"
		;;
	*)
		exit 2
		;;
esac
