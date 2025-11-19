#!/bin/bash

temp_file=/sys/class/hwmon/hwmon4/temp1_input

if [ ! -e "$temp_file" ]; then
  exit 1
fi

temp=$(cat $temp_file | awk '{printf int($1/1000)}')

echo $temp

# if [ $temp -ge 90 ]; then
#   echo "<span class='temperature-warn'>${temp}</span>"
# else
#   echo "<span class='temperature-normal'>${temp}</span>"
# fi
