#!/bin/bash

host=$(grep "^Host " ~/.ssh/config | awk '{print $2}' | wofi --dmenu)

[ -n "$host" ] && wezterm ssh "$host"
