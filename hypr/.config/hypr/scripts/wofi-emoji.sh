emoji=$(curl -s https://raw.githubusercontent.com/muan/emojilib/main/dist/emoji-en-US.json | jq -r 'keys[]' | wofi --dmenu)

[ -n "$emoji" ] && wtype "$emoji"
