#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:fab404d8359768b7d60b911678dc4b8afd4c6648; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:33554432:ccc13967bf944b10aab34c78c5648e03fe5d50f7 \
          --target EMMC:/dev/block/by-name/recovery:134217728:fab404d8359768b7d60b911678dc4b8afd4c6648 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
