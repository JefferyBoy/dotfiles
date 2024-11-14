#!/bin/bash
# 定时自动更换随机壁纸

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

while [[ true ]]; do
  $SCRIPT_DIR/hyprland-randombg.sh bing
  sleep 300 # 每隔5分钟更换壁纸
done

