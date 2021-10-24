#!/bin/bash 

hour=`date +%H`

if [ $hour -lt 12 ]; then
    notify-send -i ~/glyphs/sun.svg 'Greetings' "Good morning "${USER^}""
elif [ $hour -lt 18 ]; then
    notify-send -i ~/glyphs/sun.svg 'Greetings' "Good afternoon "${USER^}""
else
    notify-send -i ~/glyphs/night.svg 'Greetings' "Good evening "${USER^}""
fi
