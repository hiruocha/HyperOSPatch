ui_print "- 正在添加视频景深壁纸……"

local FILE=/product/media/wallpaper/sysui_editor_wallpaper_group/enable_video_depth

if cp_old_file; then
    :
elif [ -e "$FILE" ]; then
    ui_print "- 已找到文件 $(basename "$FILE")，无需修改！"
elif echo "$VERSION" | grep -q '^OS2'; then
    ui_print "- 未找到文件 $(basename "$FILE")，创建中……"
    mkdir -p "$(dirname "$MODPATH"/system"$FILE")"
    touch  "$MODPATH"/system"$FILE"
    ui_print "- 成功！"
else
    ui_print "- 非 HyperOS 2.0！"
    ui_print "- 跳过修改！"
fi
