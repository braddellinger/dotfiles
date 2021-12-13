#!/bin/sh

DEFAULT='#232a30'
TEXT='#98dce0'
WRONG='#f4a09a'
INPUT='#98dce0'

i3lock -n -i ~/wallpapers/path.jpeg \
    --ind-pos="x+1915:y+700"        \
    --date-str="%A,  %m/%d"         \
    --time-str="%H : %M"            \
    --inside-color=$DEFAULT         \
    --insidever-color=$DEFAULT      \
    --insidewrong-color=$WRONG      \
    --ringver-color=$DEFAULT        \
    --ring-color=$DEFAULT           \
    --line-color=$DEFAULT           \
    --keyhl-color=$INPUT            \
    --ringwrong-color=$WRONG        \
    --separator-color=$INPUT        \
    --verif-color=$TEXT             \
    --wrong-color=$TEXT             \
    --time-color=$TEXT              \
    --date-color=$TEXT              \
    --radius=175                    \
    --ring-width=10                 \
    --indicator                     \
    --clock                         \
    --scale

sh ~/scripts/greeting.sh
sh ~/scripts/weather.sh
