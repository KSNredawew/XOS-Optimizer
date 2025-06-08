#!/system/bin/sh

. /system/etc/XOS-optimizer/tweaks.prop

case "$performance.level" in

        echo "powersave" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        ;;
  
        echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        ;;

        echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        ;;
esac


case "$cpu.governor" in
    "interactive")
        echo "20000" > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
        echo "85" > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
        ;;
    "ondemand")
        echo "85" > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        ;;
esac


echo "1" > /sys/devices/system/cpu/sched_mc_power_savings
