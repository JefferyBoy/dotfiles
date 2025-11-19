#!/bin/bash
# 随机壁纸
type=$1
WALLPAPER_HOME_DIR="$HOME/Pictures/home_wallpapers"
WALLPAPER_BING_DIR="$HOME/Pictures/bing_wallpapers"
WALLPAPER_VIDEO_DIR="$HOME/Videos/wallpapers"

case "$type" in
family | bing)
  if [ "$type" = "family" ]; then
    img_path="$WALLPAPER_HOME_DIR"
  elif [ "$type" = "bing" ]; then
    img_path="$WALLPAPER_BING_DIR"
  fi

  if [ -d "$img_path" ]; then
    img_files=$(ls $img_path)
    for output in $(wlr-randr | grep -E "^\b" | cut -d ' ' -f 1); do
      img_file=$(echo "$img_files" | shuf -n 1)
      killall mpvpaper
      # 若swww-daemon进程不存在，则启动swww-daemon
      if [[ $(ps -ef | grep swww-daemon | grep -v grep | wc -l) -eq 0 ]]; then
        swww-daemon &
      fi
      swww img "$img_path/${img_file}" \
        --outputs "$output" \
        --transition-type grow \
        --transition-duration 2 \
        --transition-fps 60 \
        --transition-pos 0.5,1 \
        --transition-angle 180 \
        --transition-bezier 0.5,1,0.3,0.8
      if [ $? -ne 0 ]; then
        swww init
      fi
    done
  fi
  ;;
video)
  monitors=$(hyprctl monitors | grep "^Monitor " | cut -d ' ' -f 2 | xargs)
  files=$(find "$WALLPAPER_VIDEO_DIR" -type f -maxdepth 2 -name "*.mp4")
  killall mpvpaper
  for monitor in $monitors; do
    file=$(echo "$files" | shuf -n 1)
    if [ -f "$file" ]; then
      echo "set wallpaper on monitor $monitor to video: $file"
      mpvpaper --mpv-options "--no-config --no-audio --speed=0.3 --loop-file=inf" $monitor $file &
    fi
  done
  ;;
video_family)
  monitors=$(hyprctl monitors | grep "^Monitor " | cut -d ' ' -f 2 | xargs)
  files=$(find "$WALLPAPER_HOME_DIR" -type f -maxdepth 2 -name "*.mp4")
  killall mpvpaper
  for monitor in $monitors; do
    file=$(echo "$files" | shuf -n 1)
    if [ -f "$file" ]; then
      echo "set wallpaper on monitor $monitor to video: $file"
      mpvpaper --mpv-options "--no-config --loop-file=inf" $monitor $file &
    fi
  done
  ;;
esac
