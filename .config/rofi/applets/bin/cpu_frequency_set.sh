# cpu频率设置

source "$HOME"/.config/rofi/applets/bin/sudo_execute.sh
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# 获取当前的CPU策略
policy_max_freq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq)
policy_max_freq=$(echo $policy_max_freq | awk '{printf "%.1f", $1/1000000}')
policy_goveror=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor | xargs)

# 显示信息
mesg="当前策略：${policy_max_freq}MHz $policy_goveror"
# 显示菜单
menu=" 2.5GHz powersave\n 3.0GHz powersave\n 3.5GHz powersave\n 4.0GHz powersave\n 4.5GHz performance\n 5.4GHz performance"

# 调用rofi命令
rofi_cmd() {
  rofi -dmenu \
    -p 'CPU频率设置' \
    -theme ${theme} \
    -mesg "$mesg"
}

# 获取用户选择
chosen=$(echo -e "$menu" | rofi_cmd)

# 用户选择菜单后的处理
case "$chosen" in
*"2.5GHz"*)
  execute_sudo_command "cpupower frequency-set -u 2.5GHz"
  execute_sudo_command "cpupower frequency-set -g powersave"
  ;;
*"3.0GHz"*)
  execute_sudo_command "cpupower frequency-set -u 3.0GHz"
  execute_sudo_command "cpupower frequency-set -g powersave"
  ;;
*"3.5GHz"*)
  execute_sudo_command "cpupower frequency-set -u 3.5GHz"
  execute_sudo_command "cpupower frequency-set -g powersave"
  ;;
*"4.0GHz"*)
  execute_sudo_command "cpupower frequency-set -u 4.0GHz"
  execute_sudo_command "cpupower frequency-set -g powersave"
  ;;
*"4.5GHz"*)
  execute_sudo_command "cpupower frequency-set -u 4.5GHz"
  execute_sudo_command "cpupower frequency-set -g performance"
  ;;
*"5.4GHz"*)
  execute_sudo_command "cpupower frequency-set -u 5.4GHz"
  execute_sudo_command "cpupower frequency-set -g performance"
  ;;
esac
