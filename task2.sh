#!/usr/bin/env bash
if [[ $1 == "-h" ]];then
	echo "帮助信息";
	echo "-h 查看帮助信息"
	echo "-f 文件名 -age [-range]:统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比"
	echo "               [-max] :年龄最大的球员是谁"
	echo "               [-min]: 年龄最小的球员是谁"
	echo "-f 文件名 -position:统计不同场上位置的球员数量、百分比"
	echo "-f 文件名 -name [-max]|[-min]:名字最长/最短的球员"
else
	if [[ $1 != "-f" ]];then
		echo "$3错误命令。-h查看帮助信息"
	
	else
		IFS_old=$IFS
		IFS=$'\t'
                i=-1
		while read -r line;do
			array=($line)
                	if [[ $i -gt -1 ]];then 
				name[$i]=${array[8]}
				age[$i]=${array[5]}
				pos[$i]=${array[4]}
			fi
                        ((i++))
		done < $2
		

		if [[ $3 == "-age" ]];then
			if [[ $4 == "-range" ]];then
				age1=0
				age2=0
				age3=0
				i=0
				for val in ${age[@]}
				do
					
					if [[ $val -lt 20 ]];then
						((age1++))
					elif [[ $val -ge 20 ]] && [[ $val -le 30 ]];then
						((age2++))
					else
						((age3++))
					fi
					((i++))
				done
				per1=$(echo "scale=2; $age1*100/${#age[@]}" | bc -l)	
				per2=$(echo "scale=2; $age2*100/${#age[@]}" | bc -l)
				per3=$(echo "scale=2; $age3*100/${#age[@]}" | bc -l)


				echo "统计不同年龄区间范围:"
				echo "20岁以下的球员：$age1 人，占比 $per1 %"
				echo "20岁以上30岁以下的球员：$age2 人，占比 $per2 %"
				echo "30岁以上的球员：$age3 人，占比 $per3 %"
			elif [[ $4 == "-min" ]];then
				max=${age[0]}
				for val in ${age[@]}
				do
					if [[ $val -lt $max ]];then
						max=$val
					fi
				done
				i=0
				j=0
				echo "年龄最小为：$max"
				for val in ${age[@]}
				do
					if [[ $val -eq $max ]];then
						maxage[$j]=${name[$i]}
						((j++))
					fi
					((i++))
				done
				echo "名字是："
				for val in ${maxage[@]}
				do
					echo "$val"
				done	
			elif [[ $4 == "-max" ]];then
				max=${age[0]}
				
				for val in ${age[@]}
				do
					if [[ $val -gt $max ]];then
						max=$val
					fi
				done
				i=0
				j=0
				echo "年龄最大为：$max"
				for val in ${age[@]}
				do
					if [[ $val -eq $max ]];then
						maxage[$j]=${name[$i]}
						((j++))
					fi
					((i++))
				done
				echo "名字是："
				for val in ${maxage[@]}
				do
					echo "$val"
				done

			
			fi
		elif [[ $3 == "-position" ]];then
			i=0
			loc1=($(echo ${pos[*]} | sed 's/ /\n/g'|sort | uniq))
			IFS=$'\n'
			loc=($loc1)
			declare -A locnum
			for v in ${loc[@]}
			do
				locnum[$v]=0
				
			done

			for v in ${pos[@]}
			do
				x=${locnum[$v]}
				((x++))
				locnum[$v]=$x

				#if [[ ! -n locnum[${v}] ]];then
				#	locnum[${v}]=1
				#else
				#	((locum[${v}]++))
				#fi
			done
			
			
			for key in "${!locnum[@]}";do
				echo "$key： ${locnum[$key]} 人，占比为 $(echo "scale=2; ${locnum[$key]}*100/${#pos[@]}" | bc -l) %"
			done
				

		elif [[ $3 == "-name" ]];then
			n=${name[0]}
			x=$(echo ${n} | wc -c)

			if [[ $4 == "-max" ]];then
				for v in ${name[@]}
				do
					y=$(echo ${v} | wc -c)
					if [[ $y -gt $x ]];then
						x=$y
					fi
				done
				echo "名字最长的是（以字节数计算）：$x 字节"
				for v in ${name[@]}
				do
					y=$(echo ${v} | wc -c)
					if [[ $y -eq $x ]];then
						x=$y
						echo $v
					fi
				done
			elif [[ $4 == "-min" ]];then	
				for v in ${name[@]}
				do
					y=$(echo ${v} | wc -c)
					if [[ $y -lt $x ]];then
						x=$y
					fi
				done

				echo "名字最短的是（以字节数计算）：$x 字节"
				for v in ${name[@]}
				do
					y=$(echo ${v} | wc -c)
					if [[ $y -eq $x ]];then
						x=$y
						echo $v
					fi
				done

			else
				echo "$4 命令错误。-h查看帮助信"
			fi
		else
			echo "$3错误。-h查看帮助"

		fi

		IFS=$IFS_old
	fi
fi
