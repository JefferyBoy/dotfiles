#!/bin/bash

monitors=$(hyprctl monitors all | grep "^Monitor ")
monitors_num=$(echo "$monitors" | wc -l)
if [ "$monitors_num" -gt 2 ]; then
  hyprctl keyword monitor eDP-1,disable
fi
