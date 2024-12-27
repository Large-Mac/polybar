#!/bin/bash

function get_volume {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep MUTED)
    if [ -n "$muted" ]; then
        echo "婢 Muted"
    else
        if [ "$volume" -gt 66 ]; then
            echo " $volume%"
        elif [ "$volume" -gt 33 ]; then
            echo "墳 $volume%"
        else
            echo " $volume%"
        fi
    fi
}

function toggle_mute {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}

case $1 in
    mute)
        toggle_mute
        ;;
    *)
        get_volume
        ;;
esac
