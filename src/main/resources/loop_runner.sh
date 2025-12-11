#!/bin/bash

# 检查是否提供了要执行的脚本参数
if [ $# -eq 0 ]; then
    echo "用法: $0 <要执行的脚本>"
    echo "示例: $0 /path/to/your/script.sh"
    exit 1
fi

SCRIPT_TO_RUN="$1"

# 检查脚本是否存在且可执行
if [ ! -f "$SCRIPT_TO_RUN" ]; then
    echo "错误: 脚本 '$SCRIPT_TO_RUN' 不存在"
    exit 1
fi

if [ ! -x "$SCRIPT_TO_RUN" ]; then
    echo "注意: 脚本 '$SCRIPT_TO_RUN' 没有执行权限，尝试添加执行权限"
    chmod +x "$SCRIPT_TO_RUN"
    if [ $? -ne 0 ]; then
        echo "错误: 无法添加执行权限"
        exit 1
    fi
fi

echo "开始循环执行脚本: $SCRIPT_TO_RUN"
echo "按 Ctrl+C 停止"

# 无限循环
while true; do
    echo "=== 开始执行脚本 $(date) ==="

    # 执行指定的脚本
    "$SCRIPT_TO_RUN"
    EXIT_CODE=$?

    echo "=== 脚本执行完成，退出代码: $EXIT_CODE ==="

    # 等待60秒
    echo "等待60秒后再次执行..."
    sleep 60
done