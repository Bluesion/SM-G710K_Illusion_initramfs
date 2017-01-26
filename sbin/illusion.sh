#!/system/bin/sh

# Mount root as RW to apply tweaks and settings
busybox mount -o remount,rw /system
busybox mount -t rootfs -o remount,rw rootfs

# LMK
echo "1536,2048,4096,16384,28672,32768" > /sys/module/lowmemorykiller/parameters/minfree;

#Correct entropy values
echo "512" > /proc/sys/kernel/random/read_wakeup_threshold;
echo "256" > /proc/sys/kernel/random/write_wakeup_threshold;

#i/o
echo "fiops" > /sys/block/mmcblk0/queue/scheduler;

#Ondemand
echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
echo "95" > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold;
echo "50000" > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate;
echo "0" > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy;
echo "4" > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor;
echo "10" > /sys/devices/system/cpu/cpufreq/ondemand/down_differential;
echo "75" > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core;
echo "3" > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core;
echo "998400" > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq;
echo "787200" > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq;
echo "85" > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load;

#Clock Speed
echo "1190400" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq;

# Google Services battery drain fixer by Alcolawl@xda
pm enable com.google.android.gms/.update.SystemUpdateActivity
pm enable com.google.android.gms/.update.SystemUpdateService
pm enable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver
pm enable com.google.android.gms/.update.SystemUpdateService$Receiver
pm enable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver
pm enable com.google.android.gsf/.update.SystemUpdateActivity
pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity
pm enable com.google.android.gsf/.update.SystemUpdateService
pm enable com.google.android.gsf/.update.SystemUpdateService$Receiver
pm enable com.google.android.gsf/.update.SystemUpdateService$SecretCodeReceiver

rm -rf /data/data/com.sec.knox.seandroid
rm -rf /data/data/com.sec.knox.store
rm -rf /data/data/com.sec.knox.containeragent
rm -rf /data/data/com.sec.enterprise.knox.attestation
rm -rf /data/data/com.sec.knox.app.container
rm -rf /data/data/com.sec.knox.eventsmanager
rm -rf /data/data/com.samsung.knox.rcp.components
rm -rf /data/data/com.sec.enterprise.knox.cloudmdm.smdms
rm -rf /data/data/com.sec.knox.bridge
rm -rf /data/data/com.sec.knox.knoxsetupwizardclient
rm -rf /data/data/com.sec.knox.setupwizardstub
rm -rf /data/data/com.samsung.klmsagent
rm -rf /data/data/com.samsung.android.walletmanager
rm -rf /data/knox
rm -rf /data/clipboard/knox
rm /data/app/cpucontrol.apk
rm /data/app/com.androcast.illusion.cpucontrol-44.apk