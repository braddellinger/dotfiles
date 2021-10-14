#!/bin/bash 

hour=`date +%H`

if [ $hour -lt 12 ]; then
    notify-send -i ~/icons/sun.svg 'Greetings' "Good morning "${USER^}""
elif [ $hour -lt 18 ]; then
    notify-send -i ~/icons/sun.svg 'Greetings' "Good afternoon "${USER^}""
else
    notify-send -i ~/icons/night.svg 'Greetings' "Good evening "${USER^}""
fi
