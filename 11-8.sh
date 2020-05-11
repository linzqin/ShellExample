#!/usr/bin/env bash
# Prints out 0,1,2,3,4

COUNT=0
while [ $COUNT -ge 0 ]; do
	echo "Value of COUNT is: $COUNT"
	COUNT=$((COUNT+1))
	if [ $COUNT -ge 5 ] ; then
		break
	fi
done
# Prints out only odd numbers - 1,3,5,7,9
COUNT=0
while [ $COUNT -lt 10 ]; do
	COUNT=$((COUNT+1))    
	# Check if COUNT is even
	if [ $(($COUNT % 2)) = 0 ] ; then
		continue
	fi
	echo $COUNT
done
