#!/bin/bash
case $1 in
    up)   ddcutil setvcp 10 + 10 --bus=2 ;;
    down) ddcutil setvcp 10 - 10 --bus=2 ;;
esac
