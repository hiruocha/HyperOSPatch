#!/sbin/sh

for script in "$MODPATH"/script/*.sh
do
    . "$script"
done