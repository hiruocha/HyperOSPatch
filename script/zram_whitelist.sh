ui_print "- 正在添加 zram 1:1 白名单……"

FILE=/system_ext/etc/perfinit_bdsize_zram.conf
JQ="$MODPATH"/bin/jq

if cp_old_file; then
    :
elif ! echo "$VERSION" | grep -q '^OS2'; then
    ui_print "- 非 HyperOS 2.0！"
    ui_print "- 跳过修改！"
elif [ -e "$FILE" ]; then
    ui_print "- 已找到文件 $(basename "$FILE")，修改中……"
    TARGET="$MODPATH"/system"$FILE"
    mkdir -p "$(dirname "$TARGET")"
    cp -f "$FILE" "$TARGET"
    if "$JQ" -e --arg productname "$PRODUCT_NAME" '.zram[] | select(.product_name[] | contains($productname))' "$TARGET" > /dev/null; then
        ui_print "- 已存在白名单中!"
        ui_print "- 跳过修改！"
    else
        ZRAM_SIZE='{"2": 2048, "3": 3072, "4": 4096, "6": 6144, "8": 8192, "10": 10240, "12": 12288, "16": 16384, "18": 18432, "20": 20480, "24": 24576, "32": 32768}'
        NEW_ZRAM=$( "$JQ" -n --arg pn "$PRODUCT_NAME" --argjson zs "$ZRAM_SIZE" '{product_name: [$pn], zram_size: $zs}' )
        TEMP_TARGET="${TARGET}.tmp"
        "$JQ" --indent 4 --argjson new_zram "$NEW_ZRAM" '.zram += [$new_zram]' "$TARGET" > "$TEMP_TARGET"
        if [ $? -eq 0 ] && [ -s "$TEMP_TARGET" ]; then
            mv "$TEMP_TARGET" "$TARGET"
            ui_print "- 成功！"
        else
            ui_print "- 修改失败！"
            ui_print "- 跳过修改！"
            rm -f "$TEMP_TARGET"
            rm -f "$TARGET"
        fi
    fi
else
    ui_print "- 未找到文件！"
    ui_print "- 跳过修改！"
fi
