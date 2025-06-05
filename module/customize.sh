ui_print "- 开始安装……"

###############
# 主要安装函数
###############

# 导入 prop 属性
prop() {
    for PROP in "$MODPATH"/prop/*; do
        cat "$PROP" >> "$MODPATH"/system.prop
    done
}

# 为二进制文件赋予权限
chmod_bin() {
    for BIN in "$MODPATH"/bin/*; do
        chmod +x "$BIN"
    done
}

# 运行子脚本
run_script() {
    for SCRIPT in "$MODPATH"/script/*.sh; do
        . "$SCRIPT"
    done
}

# 安装完成后的清理
clean() {
    ui_print "- 正在清理……"
    rm -rf "$MODPATH"/script
    rm -rf "$MODPATH"/bin
    rm -rf "$MODPATH"/prop
}

#####################
# 供子脚本调用的函数
#####################

# 复制旧模块文件
cp_old_file() {
    if [ -e "$OLD_MODPATH"/system"$FILE" ]; then
        ui_print "- 已找到旧模块文件 $(basename "$FILE")，复制中……"
        mkdir -p "$(dirname "$MODPATH"/system"$FILE")"
        cp "$OLD_MODPATH"/system"$FILE" "$MODPATH"/system"$FILE"
        ui_print "- 成功！"
        return 0
    else
        return 1
    fi
}

###############
# 主安装逻辑
###############

main() {
    local OLD_MODPATH=/data/adb/modules/hyperos_patch
    local PRODUCT_NAME=$(getprop ro.product.name)
    local VERSION=$(getprop ro.mi.os.version.name)

    ui_print "**********************"
    ui_print " 机型：$PRODUCT_NAME"
    ui_print " 系统版本：$VERSION"
    ui_print "**********************"

    prop
    chmod_bin
    run_script
    clean
}

# 执行安装
main
