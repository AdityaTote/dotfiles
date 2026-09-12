#!/bin/bash

state_file="${XDG_RUNTIME_DIR:-/tmp}/waybar-gpu-monitor-disabled"
runtime_status=/sys/bus/pci/devices/0000:01:00.0/power/runtime_status

if [[ "$1" == toggle ]]; then
	if [[ -e "$state_file" ]]; then
		rm -f "$state_file"
		notify-send -a Waybar "NVIDIA monitoring enabled" "The RTX will wake for usage updates"
	else
		touch "$state_file"
		notify-send -a Waybar "NVIDIA auto-suspend enabled" "Monitoring stopped; applications can still wake the RTX"
	fi
	exit 0
fi

if [[ -e "$state_file" ]]; then
	runtime="unknown"
	[[ -r "$runtime_status" ]] && read -r runtime < "$runtime_status"
	printf '{"text":"󰢮  off","class":"disabled","tooltip":"NVIDIA monitoring disabled\\nRuntime state: %s\\nRight-click to enable monitoring"}\n' "$runtime"
	exit 0
fi

if ! command -v nvidia-smi >/dev/null 2>&1; then
	exit 0
fi

IFS=, read -r usage temperature memory_used memory_total < <(
	nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total \
		--format=csv,noheader,nounits 2>/dev/null
)

usage=${usage// /}
temperature=${temperature// /}
memory_used=${memory_used// /}
memory_total=${memory_total// /}

if [[ -n "$usage" ]]; then
	printf '{"text":"󰢮  %s%%","tooltip":"NVIDIA RTX 2050\\nUsage: %s%%  •  %s°C\\nVRAM: %s / %s MiB"}\n' \
		"$usage" "$usage" "$temperature" "$memory_used" "$memory_total"
fi
