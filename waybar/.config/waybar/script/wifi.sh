#!/bin/bash

case "$1" in
	settings)
		if [[ $(nmcli -t -f WIFI general) != enabled ]]; then
			nmcli networking on
			nmcli radio wifi on || exit 1
			sleep 1
		fi
		exec wezterm start --class wifi-settings -- nmtui connect
		;;
	toggle)
		if [[ $(nmcli -t -f WIFI general) == enabled ]]; then
			nmcli radio wifi off || exit 1
		else
			nmcli networking on
			nmcli radio wifi on || exit 1
			sleep 1
		fi

		state=$(nmcli -t -f WIFI general)
		if command -v notify-send >/dev/null 2>&1; then
			if [[ "$state" == enabled ]]; then
				notify-send -a Waybar "Wi-Fi enabled" "Reconnecting to known networks"
			else
				notify-send -a Waybar "Wi-Fi disabled"
			fi
		fi
		;;
	*)
		exit 2
		;;
esac
