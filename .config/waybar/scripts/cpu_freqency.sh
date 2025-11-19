#!/bin/bash

policy_max_freq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq)
policy_max_freq=$(echo $policy_max_freq | awk '{printf "%.1f", $1/1000000}')

policy_goveror=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor | xargs)
if [[ $policy_goveror == "performance" ]]; then
  policy_goveror="性能"
elif [[ $policy_goveror == "powersave" ]]; then
  policy_goveror="省电"
elif [[ $policy_goveror == "schedutil" ]]; then
  policy_goveror="调度器"
elif [[ $policy_goveror == "ondemand" ]]; then
  policy_goveror="按需"
elif [[ $policy_goveror == "convervativve" ]]; then
  policy_goveror="保守"
elif [[ $policy_goveror == "userspace" ]]; then
  policy_goveror="用户空间"
elif [[ $policy_goveror == "interactive" ]]; then
  policy_goveror="交互"
fi

echo "${policy_max_freq}GHz$policy_goveror"
