#!/sbin/sh

ui_print "- 开始安装……"
OLD_MODPATH=/data/adb/modules/hyperos_patch
for script in "$MODPATH"/script/*.sh
do
    . "$script"
done
ui_print "- 正在清理……"
rm -rf "$MODPATH"/script