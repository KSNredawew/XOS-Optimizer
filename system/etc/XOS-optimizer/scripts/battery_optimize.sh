#!/system/bin/sh

. /system/etc/XOS-optimizer/tweaks.prop

ui_print "[*] Applying battery optimizations..."

if [ "$battery.saving" == "true" ]; then
  
    settings put system screen_off_timeout 30000
    

    setprop bg_non_interactive_io_limit 1
    
  
    echo "1" > /proc/sys/net/ipv4/tcp_slow_start_after_idle
    echo "1" > /proc/sys/net/ipv4/tcp_tw_reuse

    echo "160" > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
    echo "simple_ondemand" > /sys/class/kgsl/kgsl-3d0/devfreq/governor
    
    pm disable com.google.android.gms/.update.SystemUpdateActivity
    pm disable com.google.android.gms/.update.SystemUpdateService
    
    echo "1500" > /sys/module/workqueue/parameters/power_efficient
    echo "1" > /sys/module/subsystem_restart/parameters/enable_ramdumps
fi


case "$thermal.control" in
    "aggressive")
        echo "10" > /sys/class/thermal/thermal_zone0/trip_point_0_temp
        ;;
    "moderate")
        echo "15" > /sys/class/thermal/thermal_zone0/trip_point_0_temp
        ;;
    "light")
        echo "20" > /sys/class/thermal/thermal_zone0/trip_point_0_temp
        ;;
esac

ui_print "[+] Battery optimizations applied!"
