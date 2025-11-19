# 获取系统信息

source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/%us,//')
MEMORY_USAGE=$(free | grep Mem | awk '{printf("%.1f%%", $3/$2 * 100.0)}')
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print $5}' | sed 's/%//')

# 显示菜单
menu="🖥️  CPU: $CPU_USAGE\n💾  内存: $MEMORY_USAGE\n🔊  音量: $VOLUME%\n🔄  刷新\n❌  退出"

rofi_cmd() {
  rofi -dmenu \
    -p '系统信息' \
    -theme ${theme} \
    -mesg "hello ok"
}

chosen=$(echo -e "$menu" |  rofi_cmd)

case "$chosen" in
    *"CPU"*)
        notify-send "CPU使用率" "$CPU_USAGE"
        ;;
    *"内存"*)
        notify-send "内存使用率" "$MEMORY_USAGE"
        ;;
    *"音量"*)
        notify-send "系统音量" "${VOLUME}%"
        ;;
    *"刷新"*)
        exec "$0"
        ;;
esac
