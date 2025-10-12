LOW_BATTERY_LEVEL=10   # Alert when battery <= this %
CHECK_INTERVAL=60      # Check every 60 seconds

while true; do
    BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT*/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT*/status)

    if [[ "$STATUS" == "Discharging" && "$BATTERY_LEVEL" -le "$LOW_BATTERY_LEVEL" ]]; then
        notify-send \
            -u critical \
            -a "Battery Alert" \
            -t 7000 \
            "⚠️ <b>Low Battery</b>" \
            "🔋 Battery at <b>${BATTERY_LEVEL}%</b>\n💡 Please connect the charger."

        sleep 300 # Wait 5 mins before next alert
    else
        sleep $CHECK_INTERVAL
    fi
done
