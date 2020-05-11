#!/usr/bin/env bash
COUNT=4
while [ $COUNT -gt 0 ]; do
	echo "Value of count is: $COUNT"
	COUNT=$(($COUNT - 1))
done

COUNT=4
while [ : ]; do
	echo "Value of count is: $COUNT"
	COUNT=$(($COUNT - 1))
	if [[ $COUNT -eq 0 ]];then
		break
	fi
done
