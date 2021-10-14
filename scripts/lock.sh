#!/bin/bash 

DEFAULT='#232a30'
TEXT='#98c0e0'
WRONG='#f4a09a'
INPUT='#9ab0f4'

i3lock -n -i ~/wallpapers/shore.jpg \
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
    --separator-color=$WRONG        \
    --verif-color=$TEXT             \
    --wrong-color=$TEXT             \
    --time-color=$TEXT              \
    --date-color=$TEXT              \
    --radius=150                    \
    --indicator                     \
    --clock                         \
    --scale

sh ~/scripts/greeting.sh
