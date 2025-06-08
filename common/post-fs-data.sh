#!/system/bin/sh

MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
done

. /system/etc/XOS-optimizer/scripts/battery_optimize.sh
. /system/etc/XOS-optimizer/scripts/memory_optimize.sh
. /system/etc/XOS-optimizer/scripts/cpu_optimize.sh

chmod 644 /system/etc/XOS-optimizer/tweaks.prop
chmod 755 /system/etc/XOS-optimizer/scripts/*.sh
