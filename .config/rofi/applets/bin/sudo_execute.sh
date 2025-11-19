# 创建安全的密码输入脚本
_create_password_prompt() {
  local temp_script="/tmp/sudo_askpass_$$"
  cat >"$temp_script" <<EOF
#!/bin/bash
rofi -dmenu -password -p "请输入密码："
EOF
  chmod 700 "$temp_script"
  echo "$temp_script"
}

# 执行sudo命令的函数
execute_sudo_command() {
  local cmd="$1"
  local description="$2"

  # 创建askpass脚本
  local askpass_script=$(_create_password_prompt)
  export SUDO_ASKPASS="$askpass_script"

  # 执行命令
  if ! sudo -A $cmd; then
    notify-send "sudo 执行失败"
  fi

  # 清理临时文件
  rm -f "$askpass_script"
}
