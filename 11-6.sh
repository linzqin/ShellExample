#!/usr/bin/env bash
COUNT=1
until [ $COUNT -gt 5 ]; do
	echo "Value of count is: $COUNT"
	COUNT=$(($COUNT + 1))
done
