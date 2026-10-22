#!/bin/bash
WALLPAPER="$HOME/Pictures/Wallpapers/04xdurl1o7v21.png"

until pgrep -x hyprpaper > /dev/null; do
    sleep 0.1
done

sleep 0.5
hyprctl hyprpaper preload "$WALLPAPER"

hyprctl monitors | grep -q "HDMI-A-1" && \
    hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER"

hyprctl monitors | grep -q "eDP-1" && \
    hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"
