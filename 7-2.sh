#!/usr/bin/env bash
# 声明一个「索引」数组
declare -a indexed_arr

# 声明一个「关联」数组
declare -A associative_arr

# Bash 数组赋值方法如下
# 「索引」数组可以跳过数组声明直接赋值的同时即完成了数组初始化
my_array=(apple banana "Fruit Basket" orange)

associative_arr['hello']='world'
associative_arr['well']='done'

# bash支持“稀疏”数组：即数组元素不必连续存在，个别索引位置上可以有未初始化的元素
new_array[2]=apricot

# 数组元素的个数通过 ${#arrayname[@]} 获得
echo ${#my_array[@]}

# 随机读取数组中的元素，{}是必须有的
echo ${my_array[2]}
# echo $my_array[2] 是错误的读取方法

# 遍历数组的方法
## 「索引」数组
for ele in "${my_array[@]}";do
	echo "$ele"
done

## 「关联」数组
for key in "${!associative_arr[@]}";do
	echo "$key ${associative_arr[$key]}"
done

