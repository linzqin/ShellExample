#!usr/bin/env bash
if [[ $1 == "-h" ]];then
	echo "帮助信息:";
	echo "帮助信息:";
	echo "-h                         : 查看帮助信息";
	echo "-f 文件名 -cr -size 长宽 -o 输出文件夹: 对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率";
	echo "-f 文件名 -w 文本水印 嵌入位置 -o 输出文件夹: 对图片批量添加自定义文本水印";
	echo "-f 文件名 -rn -f|-b 前缀/后缀 -o 输出文件夹: 批量重命名统一添加文件名前缀或后缀";
	echo "-f 文件名 -jpg -o 输出文件夹: 将png/svg图片统一转换为jpg格式图片";

elif [[ $1 == "-f" ]];then
	if [[ $3 == "-qc" ]];then
		echo "压缩";
		for file in $2/*
		do
			na=$file;
			na1=".jpg";
			outname=${na##*/}
			if [[ $file == *$na1* ]];then
				echo $outname;
				convert -quality $5 $file $7/$outname;
			fi
		done
		echo "质量压缩完成";
	elif [[ $3 == "-cr" ]];then
		echo "压缩分辨率";
		for file in $2/*
		do
			na=$file;
			na1=".jpg";
			na2=".png";
			na3=".svg";
			outname=${na##*/};
			if [[ $file == *$na1* || $file == *$na2* || $file == *$na3* ]];then
				convert -resize $5 $file $7/$outname;
			fi
		done
		echo "等比例压缩分辨率完成";
	elif [[ $3 == "-w" ]];then
		echo "添加自定义文本水印";
		for file in $2/*
		do
			na=$file;
			outname=${na##*/};
			convert $file -draw "text $5 $4" $7/$outname;
		done
		echo "自定义文本添加完成";
	elif [[ $3 == "-rn" ]];then
		echo "重命名";
		for file in $2/*
		do
			na=$file;
			outname=${na##*/}
			if [[ $4 == "-f" ]];then
				newname=$7/$5$outname;
			elif [[ $4 == "-b" ]];then
				newname=$7/$outname$5;
			else
				echo "错误命令。-h查看帮助";
			fi
			mv $file $newname;
		done
		echo "重命名完成";
	elif [[ $3 == "-jpg" ]];then
		echo "转换为jpg格式图片";
		for file in $2/*
		do
			na=$file;
			na1=".png";
			na2=".svg";
			na3=".jpg";
			outname=${na##*/};
			outname1=${outname%%.*};
			if [[ $file == *$na1* || $file == *$na2* ]];then
				echo $outname1;
				convert $file $5/$outname1$na3;
			fi
		done
		echo "转化成jpg";
	else
		echo "错误命令。-h查看帮助"；
	fi
else
	echo "错误命令。-h查看帮助";
fi
