#!/bin/bash
# 定时自动更换随机壁纸

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

while [[ true ]]; do
  video_wallpaper_process=$(ps -ef | grep mpvpaper | grep -v grep | wc -l)
  if [ $video_wallpaper_process -eq 0 ]; then
    $SCRIPT_DIR/hyprland-randombg.sh bing
  fi
  sleep 300 # 每隔5分钟更换壁纸
done
