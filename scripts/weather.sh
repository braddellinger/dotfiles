#!/bin/sh

tmp_dir='/tmp/weather'
tmp_description=$tmp_dir/description
tmp_temperature=$tmp_dir/temperature
tmp_icon=$tmp_dir/icon

if [ ! -d $tmp_dir ]; then
    mkdir -p $tmp_dir
fi

key=
units='imperial'
lon=
lat=

weather=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${key}&units=${units}")

if [ ! -z '$weather' ]; then
    description=$(echo $weather | jq -r '.weather[].description' | head -1 | sed -e "s/\b\(.\)/\u\1/g")
    temperature=$(echo $weather | jq '.main.temp' | cut -d '.' -f 1)
    icon_code=$(echo $weather | jq -r '.weather[].icon' | head -1)

    if [ $icon_code == '01d' ]; then # clear sky
        icon=''
    elif [ $icon_code == '02d' ]; then # few clouds
        icon=''
    elif [ $icon_code == '03d' ]; then # scattered clouds
        icon=''
    elif [ $icon_code == '04d' ]; then # broken clouds
        icon=''
    elif [ $icon_code == '09d' ]; then # shower rain
        icon=''
    elif [ $icon_code == '10d' ]; then # rain
        icon=''
    elif [ $icon_code == '11d' ]; then # thunderstorm
        icon=''
    elif [ $icon_code == '13d' ]; then # snow
        icon='ﰕ'
    elif [ $icon_code == '50d' ]; then # mist
        icon=''
    else # unknown
        icon='?'
    fi

    echo $description > $tmp_description
    echo $temperature° > $tmp_temperature
    echo $icon > $tmp_icon
fi
