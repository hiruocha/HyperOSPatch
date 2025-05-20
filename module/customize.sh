ui_print "- 开始安装……"

OLD_MODPATH=/data/adb/modules/hyperos_patch
PRODUCT_NAME=$(getprop ro.product.name)
VERSION=$(getprop ro.mi.os.version.name)

for BIN in "$MODPATH"/bin/*
do
    chmod +x "$BIN"
done

JQ="$MODPATH"/bin/jq

for script in "$MODPATH"/script/*.sh
do
    . "$script"
done

ui_print "- 正在清理……"
rm -rf "$MODPATH"/script
rm -rf "$MODPATH"/bin
