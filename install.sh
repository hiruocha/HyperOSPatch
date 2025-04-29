#!/sbin/sh

ui_print "开始安装……"
for script in "$MODPATH"/script/*.sh
do
    . "$script"
done