#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:812e3d645cc800032ff423ccb9954358c94d92cf; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:320ccfc7ccf85d656a7cb681c7af31816ba962d7 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:812e3d645cc800032ff423ccb9954358c94d92cf && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
