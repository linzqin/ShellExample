#!/bin/bash
echo $3 # --> results with: banana

BIG=$5

echo "A $BIG costs just $6"

# 输出所有参数
echo "$@"

# 以下代码输出命令行参数的总数
echo $#
