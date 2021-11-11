#!/bin/sh

killall -q polybar
polybar main -r -c ~/.config/polybar/config.ini
echo 'Launched polybar main!'
