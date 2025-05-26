ui_print "- 正在去除国行系统 GMS 限制……"

FILE=/product/etc/permissions/cn.google.services.xml

if [ -e "$OLD_MODPATH"/system"$FILE" ]
then
    ui_print "- 已找到旧模块文件 $(basename "$FILE")，复制中……"
    mkdir -p "$(dirname "$MODPATH"/system"$FILE")"
    cp "$OLD_MODPATH"/system"$FILE" "$MODPATH"/system"$FILE"
    ui_print "- 成功！"
elif [ -e "$FILE" ]
then
    ui_print "- 已找到文件 $(basename "$FILE")，修改中……"
    TARGET="$MODPATH"/system"$FILE"
    mkdir -p "$(dirname "$TARGET")"
    cp -f "$FILE" "$TARGET"
    sed -i '/cn.google.services/d' "$TARGET"
    sed -i '/services_updater/d' "$TARGET"
    ui_print "- 成功！"
else
    ui_print "- 未找到文件，可能是非国行系统！"
    ui_print "- 跳过修改！"
fi
