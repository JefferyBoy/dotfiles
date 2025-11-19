#!/bin/bash
# 系统温度信息

# 获取cpu、内存、硬盘、显卡等温度信息
if [[ ! command -v sensors ]]; then
    echo "command not found: sensors"
    exit 1
fi

sensors_info=$(sensors)

temp_cpu=$(echo "$sensors_info" | grep "Tctl:  0" | awk '{print $2}')
temp_gpu=$(echo "$sensors_info" | grep "GPU Temperature: " | awk '{print $2}')
