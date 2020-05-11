#!/usr/bin/env bash
pi=$(echo "scale=10; 4*a(1)" | bc -l)

# 计算 4 * arctangent(1) ，计算结果保留 1000 位有效数字
# 禁止输出结果因超长而自动折行
pi=$(BC_LINE_LENGTH=0 bc -l <<< "scale=1000; 4*a(1)")
