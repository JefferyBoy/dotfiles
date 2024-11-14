#!/bin/bash
# 随机壁纸
type=$1
if [ "$type" = "family" ]; then
  img_path=~/Pictures/home_wallpapers
elif [ "$type" = "bing" ]; then
  img_path=~/Pictures/bing_wallpapers
else
  img_path=~/.config/hypr/images
fi
img_files=$(ls $img_path)
for output in $(wlr-randr | grep -E "^\b" | cut  -d ' ' -f 1); do
  img_file=$(echo "$img_files" | shuf -n 1)
  swww img "$img_path/${img_file}" \
    --outputs "$output" \
    --transition-type grow  \
    --transition-duration 1 \
    --transition-fps 60 \
    --transition-pos center \
    --transition-angle 180 \
    --transition-bezier 0.5,1,0.3,0.8
done

