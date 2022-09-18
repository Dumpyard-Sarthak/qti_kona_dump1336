#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:4eb36e0412539d8d4b329b124f171d550939ffa1; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:9f1aede6a007ce44bf545c9fe94b3d3a7ea36fc4 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:4eb36e0412539d8d4b329b124f171d550939ffa1 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
