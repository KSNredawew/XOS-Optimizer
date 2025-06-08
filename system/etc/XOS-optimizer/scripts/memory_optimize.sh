#!/system/bin/sh

. /system/etc/XOS-optimizer/tweaks.prop

ui_print "[*] Applying memory optimizations..."

if [ "$memory.optimize" == "true" ]; then

    echo "0,1,2,4,9,12" > /sys/module/lowmemorykiller/parameters/adj
    echo "5120,10240,12800,15360,17920,20480" > /sys/module/lowmemorykiller/parameters/minfree
    
    swapoff /dev/block/zram0
    echo "1" > /sys/block/zram0/reset
    echo "lz4" > /sys/block/zram0/comp_algorithm
    echo "1073741824" > /sys/block/zram0/disksize
    mkswap /dev/block/zram0
    swapon /dev/block/zram0

    echo "100" > /proc/sys/vm/swappiness
    echo "10" > /proc/sys/vm/vfs_cache_pressure
    echo "10" > /proc/sys/vm/dirty_ratio
    echo "5" > /proc/sys/vm/dirty_background_ratio

    killall -9 android.process.media
fi


case "$performance.level" in

        echo "60" > /proc/sys/vm/swappiness
        ;;
    
        echo "100" > /proc/sys/vm/swappiness
        ;;

        echo "150" > /proc/sys/vm/swappiness
        echo "2048" > /proc/sys/vm/min_free_kbytes
        ;;
esac

ui_print "[+] Memory optimizations applied!"
