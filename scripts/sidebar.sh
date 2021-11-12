#!/bin/sh

window_options='pacman weather lock logout restart poweroff'
grep_options='\*pacman|\*weather'

windows=`~/github/eww/target/release/eww windows`

if echo $windows | grep -E $grep_options > /dev/null; then
    ~/github/eww/target/release/eww close $window_options
else
    ~/github/eww/target/release/eww open-many $window_options
fi
