#!/usr/bin/env bash

NAMES=(Joe Jenny Sara Tony)
for N in ${NAMES[@]} ; do
	echo "My name is $N"
done

# loop on command output results
IFS=$'\n'
for f in $(ps -eo command) ; do
       echo "$f"
done
