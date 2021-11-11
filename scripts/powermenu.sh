#!/bin/sh

cmd="rofi -theme ~/.config/rofi/powermenu.rasi -dmenu -selected-row 1"

reboot="累"
lock=""
poweroff="襤"

action="$(echo -e "$reboot\n$lock\n$poweroff" | $cmd)"
case $action in
    $reboot   ) reboot ;;
    $lock     ) ~/scripts/lock.sh ;;
    $poweroff ) poweroff ;;
esac
