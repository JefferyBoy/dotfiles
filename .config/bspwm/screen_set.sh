# 多显示器 
monitorCount=`xrandr --listmonitors | wc -l`
if [ $monitorCount -gt 2 ]; 
  then
    cpu=`cat /proc/cpuinfo | grep "AMD Ryzen 7 3700X"`
    if [ -z "$cpu"  ];
    then
        mainMonitor="HDMI-0"
        subMonitor="DVI-D-0"
        xrandr --output $mainMonitor --primary --mode 1920x1080 
        xrandr --output $subMonitor --right-of $mainMonitor
        bspc monitor $mainMonitor -n center
        bspc monitor center -d 1 2 3 4 5
    else
        mainMonitor="DVI-D-0"
        subMonitor="HDMI-A-0"
        xrandr --output $mainMonitor --primary --mode 1920x1080 
        xrandr --output $subMonitor --above $mainMonitor
        bspc monitor $mainMonitor -n center
        bspc monitor center -d 1 2 3 4 5
    fi
    # bspc monitor $subMonitor -n right
    # bspc monitor right -d 4 5 6
    # xrandr --output DVI-D-0 --off
  else
    bspc monitor -d 1 2 3 4 5
fi
