#!/usr/bin/env bash
STRING="to be or not to be"
echo ${STRING[@]//be/eat}  # to eat or not to eat

# 字符串查找并删除（替换为空）所有匹配到的子串
STRING="to be or not to be"
echo ${STRING[@]// not/}        # to be or to be

# 字符串查找并替换匹配到行首的子串
STRING="to be or not to be"
echo ${STRING[@]/#to be/eat now}    # eat now or not to be

# 字符串查找并替换匹配到行尾的子串
STRING="to be or not to be"
echo ${STRING[@]/%be/eat}        # to be or not to eat

# 字符串查找并使用子命令输出结果替换匹配项
STRING="to be or not to be"
echo ${STRING[@]/%be/be on $(date +%Y-%m-%d)}    # to be or not to be on 2012-06-14
