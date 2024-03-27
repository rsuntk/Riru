#!/system/bin/sh
MODDIR=${0%/*}
TMPPROP="${TMPDIR}/riru.prop"
MIRRORPROP="/data/adb/modules/riru-core/module.prop"
sh -Cc "cat '$MODDIR/module.prop' > '$TMPPROP'"
if [ $? -eq 0 ]; then
  mount --bind "$TMPPROP" "$MIRRORPROP"
  sed -Ei 's/^description=(\[.*][[:space:]]*)?/description=[ ⛔ post-fs-data.sh fails to run. KernelSU is broken on this device. ] /g' "$MODDIR/module.prop"
  exit
fi

