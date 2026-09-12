#!/bin/bash

file=$(fd . ~ | wofi --dmenu --prompt "Files")

[ -n "$file" ] && xdg-open "$file"
