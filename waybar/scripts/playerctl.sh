#!/bin/bash
status=$(playerctl status 2>/dev/null)
case "$status" in
    Playing) printf "" ;;
    Paused) printf "" ;;
    Stopped) printf "" ;;
    *) printf "" ;;
esac
