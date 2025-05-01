ui_print "- 正在去除国行系统 GMS 限制……"
file=/product/etc/permissions/cn.google.services.xml
if [ -e "$OLD_MODPATH/system$file" ]
then
    ui_print "- 已找到旧模块文件 $(basename $file)，复制中……"
    mkdir -p "$(dirname "$MODPATH/system$file")"
    cp "$OLD_MODPATH/system$file" "$MODPATH/system$file"
    ui_print "- 成功！"
elif [ -e "$file" ]
then
    ui_print "- 已找到文件 $(basename $file)，修改中……"
    target="$MODPATH/system$file"
    mkdir -p $(dirname "$target")
    cp -f "$file" "$target"
    sed -i '/cn.google.services/d' "$target"
    sed -i '/services_updater/d' "$target"
    ui_print "- 成功！"
else
    ui_print "- 未找到文件，可能是非国行系统！"
    ui_print "- 跳过修改！"
fi