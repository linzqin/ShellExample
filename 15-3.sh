#!/usr/bin/env bash
# 清空一个文件（文件大小变为0）
> file
# 用一段文本内容覆盖一个文件
echo "some string" > file
# 在文件尾部追加内容
echo "some string" >> file

read -r line < file
IFS= read -r line < file
# 利用外部程序head
line=$(head -1 file)
line=`head -1 file`
# 构造一个「畸形」测试用例
echo -n -e " 123 \x0a456" > file
# 逐行读文件 **有 BUG**
while read -r line; do
	echo "$line" | xxd -p
done < file
while IFS= read -r line; do
	# do something with $line
	echo "$line" | xxd -p
done < file
while IFS= read -r line || [[ -n "$line" ]]; do
	# do something with $line
	echo "$line" | xxd -p
done < file
