ui_print "- 正在添加视频景深壁纸……"

file=/product/media/wallpaper/sysui_editor_wallpaper_group/enable_video_depth

if [ -e "$OLD_MODPATH"/system"$file" ]
then
    ui_print "- 已找到旧模块文件 $(basename "$file")，复制中……"
    mkdir -p "$(dirname "$MODPATH"/system"$file")"
    cp "$OLD_MODPATH"/system"$file" "$MODPATH"/system"$file"
    ui_print "- 成功！"
elif [ -e "$file" ]
then
    ui_print "- 已找到文件 $(basename "$file")，无需修改！"
elif echo "$VERSION" | grep -q '^OS2'
then
    ui_print "- 未找到文件 $(basename "$file")，创建中……"
    mkdir -p "$(dirname "$MODPATH"/system"$file")"
    touch  "$MODPATH"/system"$file"
    ui_print "- 成功！"
else
    ui_print "- 非 HyperOS 2.0！"
    ui_print "- 跳过修改！"
fi