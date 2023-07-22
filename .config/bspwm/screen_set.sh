# 针对不同的电脑环境进行配置，如多显示器
function configForEnvironment() {
  config_success=0
  cpu=`cat /proc/cpuinfo | grep "model name" | cut -d ':' -f 2 | awk 'NR==1{print $0}'`
  echo $cpu
  # 家里电脑
  if [ "$cpu" = " AMD Ryzen 7 3700X" ];
    then
      echo 家里电脑
      config_success=1
      mainMonitor="HDMI-0"
      subMonitor="DVI-D-0"
      xrandr --output $mainMonitor --primary --mode 1920x1080 
      xrandr --output $subMonitor --right-of $mainMonitor
      bspc monitor $mainMonitor -n center
      bspc monitor center -d 1 2 3 4 5
  fi
  # 公司电脑
  if [ "$cpu" = " Intel I5 4125" ];
    then
      echo 公司电脑
      config_success=1
      mainMonitor="HDMI-0"
      subMonitor="DVI-D-0"
      xrandr --output $mainMonitor --primary --mode 1920x1080 
      xrandr --output $subMonitor --right-of $mainMonitor
      bspc monitor $mainMonitor -n center
      bspc monitor center -d 1 2 3 4 5
  fi
  # 笔记本
  if [ "$cpu" = " AMD Ryzen 7 6800H with Radeon Graphics" ];
    then
      echo 笔记本
      config_success=1
      mainMonitor="eDP"
      xrandr --output $mainMonitor --primary --mode 1920x1200 --brightness 0.5
      bspc monitor $mainMonitor -n center
      bspc monitor center -d 1 2 3 4 5
  fi
  # bspc monitor $subMonitor -n right
  # bspc monitor right -d 4 5 6
  # xrandr --output DVI-D-0 --off
  # 未识别的电脑使用默认配置
  if [ $config_success -eq 0 ];
    then
      echo 未识别
      mainMonitor=`xrandr --listmonitors | awk 'NR==2{print $4}'`
      xrandr --output $mainMonitor --mode 1920*1080
      bspc monitor -d 1 2 3 4 5
  fi
}

configForEnvironment
