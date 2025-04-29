#!/sbin/sh

for script in "$MODPATH"/script/*.sh
do
    sh "$script"
done