# Get the current Wi-Fi SSID
INFO="$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')"

# Check if connected to a Wi-Fi network
if [[ -z "$INFO" ]]; then
    # Not connected to Wi-Fi
    ICON="󰖪 "  # Use an icon for "not connected" (you can change this to whatever you like)
    INFO="Disconnected"  # Set the label to "Disconnected"
else
    ICON=""  # Icon for connected Wi-Fi
    INFO=$(echo "$INFO")  # Use the actual SSID
fi

case "$SENDER" in
"mouse.entered")
    sketchybar --set $NAME label="$INFO" label.drawing=on
    ;;
"mouse.exited")
    sketchybar --set $NAME label.drawing=off
    ;;
*)
    sketchybar --set $NAME icon="$ICON" label="$INFO" label.drawing=off
    ;;
esac
