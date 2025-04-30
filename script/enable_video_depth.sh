ui_print "- 正在添加视频景深壁纸……"
file=/product/media/wallpaper/sysui_editor_wallpaper_group/enable_video_depth
if [ -e "$file" ]
then
    ui_print "- 已找到文件，无需修改！"
elif getprop ro.build.version.incremental | grep -q '^OS2'
then
    ui_print "- 正在添加……"
    mkdir -p "$(dirname "$MODPATH/system$file")"
    touch  "$MODPATH/system$file"
    ui_print "- 成功！"
else
    ui_print "- 非 HyperOS 2，跳过修改！"
fi