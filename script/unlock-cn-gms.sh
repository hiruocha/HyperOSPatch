file=/product/etc/permissions/cn.google.services.xml
if [ -e "$file" ]
then
    ui_print "已找到文件$file，修改中……"
    target=$MODPATH/system$file
    mkdir -p $(dirname $target)
    cp -f $file $target
    sed -i '/cn.google.services/d' $target
    sed -i '/services_updater/d' $target
    ui_print "成功！"
else
    ui_print "未找到文件！"
fi