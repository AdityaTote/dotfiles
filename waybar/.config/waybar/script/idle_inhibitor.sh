#!/bin/bash

unit=waybar-idle-inhibitor.service

is_active() {
	systemctl --user --quiet is-active "$unit"
}

case "$1" in
	status)
		if is_active; then
			printf '%s\n' '{"text":"󰅶","class":"activated","tooltip":"Idle inhibitor active\\nLeft: edit settings  •  Right: allow idle"}'
		else
			printf '%s\n' '{"text":"󰾪","class":"deactivated","tooltip":"Idle inhibitor inactive\\nLeft: edit settings  •  Right: prevent idle"}'
		fi
		;;
	toggle)
		if is_active; then
			systemctl --user stop "$unit"
		else
			systemd-run --user --quiet --collect --unit=waybar-idle-inhibitor \
				systemd-inhibit --what=idle --who=Waybar \
				--why="Enabled from Waybar" --mode=block sleep infinity
		fi
		;;
	settings)
		exec wezterm start --class idle-settings -- bash -lc \
			'nvim "$HOME/.config/hypr/hypridle.conf"; pkill -x hypridle; hypridle >/dev/null 2>&1 &'
		;;
	*)
		exit 2
		;;
esac
