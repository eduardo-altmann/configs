#!/bin/bash
while true; do
    CAP=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$STATUS" = "Discharging" ]; then
        if [ "$CAP" -le 10 ]; then
            notify-send -u critical "Bateria crítica" "${CAP}% — conecte o carregador!"
        elif [ "$CAP" -le 20 ]; then
            notify-send -u normal "Bateria baixa" "${CAP}%"
        fi
    fi

    sleep 60
done
