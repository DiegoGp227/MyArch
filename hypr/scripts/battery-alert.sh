#!/bin/bash

BAT="/org/freedesktop/UPower/devices/battery_BAT0"
STATE_FILE="/tmp/battery-alert-level"

while true; do
    PERCENT=$(upower -i "$BAT" 2>/dev/null | awk '/percentage:/ {print $2}' | tr -d '%')
    STATE=$(upower -i "$BAT" 2>/dev/null | awk '/state:/ {print $2}')

    if [ "$STATE" != "discharging" ] || [ -z "$PERCENT" ]; then
        rm -f "$STATE_FILE"
        sleep 60
        continue
    fi

    LEVEL=0
    if [ "$PERCENT" -le 5 ]; then
        LEVEL=3
    elif [ "$PERCENT" -le 10 ]; then
        LEVEL=2
    elif [ "$PERCENT" -le 20 ]; then
        LEVEL=1
    fi

    [ "$LEVEL" -eq 0 ] && { rm -f "$STATE_FILE"; sleep 60; continue; }

    LAST=$(cat "$STATE_FILE" 2>/dev/null || echo 0)

    if [ "$LEVEL" -gt "$LAST" ]; then
        case "$LEVEL" in
            3)
                notify-send "Batería crítica: ${PERCENT}%" "Hibernando el equipo..." -u critical -i battery-empty
                sleep 5
                systemctl hibernate
                ;;
            2)
                notify-send "Batería baja: ${PERCENT}%" "Conecta el cargador ahora" -u critical -i battery-low
                ;;
            1)
                notify-send "Batería al ${PERCENT}%" "Nivel de batería" -u normal -i battery
                ;;
        esac
        echo "$LEVEL" > "$STATE_FILE"
    fi

    sleep 60
done
