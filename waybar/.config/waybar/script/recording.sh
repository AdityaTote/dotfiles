#!/bin/bash

recording=false

if pgrep -x 'wf-recorder|gpu-screen-recorder|kooha|simplescreenrecorder' >/dev/null 2>&1; then
	recording=true
elif command -v pw-cli >/dev/null 2>&1; then
	pipewire_nodes=$(pw-cli ls Node 2>/dev/null)
	case "$pipewire_nodes" in
		*portal*|*screencast*|*ScreenCast*|*screen-cast*|*xdpw*) recording=true ;;
	esac
fi

if [[ "$recording" == true ]]; then
	printf '%s\n' '{"text":"󰑊","class":"active","tooltip":"Screen capture or sharing is active"}'
fi
