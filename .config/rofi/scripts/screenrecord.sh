#!/bin/bash

function start() {
  echo "开始录屏，保存位置： $outputfile"
  echo "按ctrl+c结束"
  trap handle_sigint SIGINT
  adb -s $device shell screenrecord /sdcard/screenrecord.mp4
}

function end() {
  adb -s $device pull /sdcard/screenrecord.mp4 $outputfile
  adb -s $device shell rm /sdcard/screenrecord.mp4
}

function handle_sigint() {
  sleep 1
  end
  exit 0
}

device_count=$(adb devices | grep -E "\bdevice$" | wc -l)
if [[ $device_count -ne 1 ]]; then
  echo "Error: you must connect an android device"
  exit 1
fi
device=$(adb devices | grep -E "\bdevice$" | awk 'NR=1{print $1}')
if [[ ${#device} -lt 1 ]]; then
  echo "Error: could not find device name"
  exit 1
fi
outputfile="$HOME/Downloads/$(date "+%Y-%m-%d_%H:%M:%S").mp4"

if [[ $1 = 'stop' ]]; then
  end
else
  start
fi
