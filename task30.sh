#!/usr/bin/env bash
if [[ $1 == "-h" ]];then
	echo "帮助信息"
	echo "-h 查看帮助信息"
	echo "-f 文件名 -host：统计访问来源主机TOP 100和分别对应出现的总次数"
	echo "-f 文件名 -ip： 统计访问来源主机TOP 100 IP和分别对应出现的总次数"
	echo "-f 文件名 -url：统计最频繁被访问的URL TOP 100"
elif [[ $1 == "-f" ]];then
	IFS_old=$IFS
	IFS=$'\t'
	i=-1
	while read -r line;do
		array=($line)
		if [[ $i -gt -1 ]];then
			host[$i]=${array[0]}
			url[$i]=${array[4]}
			code[$i]=${array[5]}
		fi
		((i++))
	done < $2
	#echo ${host[*]}
	#echo ${url[*]}
	#echo ${name[*]}
	if [[ $3 == "-url" ]];then
		dic1=($(echo ${url[*]} | sed 's/ /\n/g'|sort | uniq))
		echo "去重完成"
		IFS=$'\n'
		dic=($dic1)
		echo "分段之后的：${#dic[@]} ${dic1[@]}"
		declare -A urlnum
		for v in ${dic}
		do
			urlnum[$v]=0
		done
		for v in ${url[@]}
		do
			x=${urlnum[$v]}
			((x++))
			urlnum[$v]=$x
		done
		for key in "${!hostnum[@]}";do
			echo "$key： ${hostnum[$key]}"
		done
		i=0
		
		#echo "开始排序"
		#t=${url[0]}
		#for((i=0;i<100;i++));
		#do
		#	max=${urlnum[$t]}
		#	m=$t

		#	for v in ${url[@]};
		#	do
		#		x=${urlnum[$v]}
		#		if [[ $x -gt $max ]];then
		#			max=$x
		#			m=$v
		#		fi	
		#	done

		#	echo "TOP$((i+1)):   $m             次数是：$max"
		#	urlnum[$m]=-1

		#done
:<<!

	elif [[ $3 == "-host" || $3 == "-ip" ]];then
		dic1=($(echo ${host[*]} | sed 's/ /\n/g'|sort | uniq))
		#echo "去重完成"
		IFS=$'\n'
		dic=($dic1)
		#echo "分段之后的：${#dic[@]} ${dic1[@]}"
		declare -A hostnum
		for v in ${dic}
		do
			hostnum[$v]=0
		done
		for v in ${host[@]}
		do
			x=${hostnum[$v]}
			((x++))
			hostnum[$v]=$x
		done
		#for key in "${!hostnum[@]}";do
		#	echo "$key： ${hostnum[$key]}"
		#done
		i=0
		for key in "${!hostnum[@]}";do
			#echo $key
			if [[ $3 == "-host" ]];then

				if [[ $key == *[a-zA-Z]* ]];then
					name[$i]=$key
					#echo "--------------------    ${name[$i]}"
					((i++))
				fi
			fi

			if [[ $3 == "-ip" ]];then
				if [[ $key == *[a-zA-Z]* ]];then
					x=1
				else
					name[$i]=$key
					((i++))
				fi
			fi

		done
		echo "开始排序"
		t=${name[0]}
		for((i=0;i<100;i++));
		do
			max=${hostnum[$t]}
			m=$t

			for v in ${name[@]};
			do
				x=${hostnum[$v]}
				if [[ $x -gt $max ]];then
					max=$x
					m=$v
				fi	
			done

			echo "TOP$((i+1)):   $m             次数是：$max"
			hostnum[$m]=-1

		done
!
	else
		echo "$3错误命令。-h查看帮助信息"

	fi
else
	echo "$1错误命令。-h查看帮助信息"
fi
