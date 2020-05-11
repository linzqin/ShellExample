#!/usr/bin/env bash
FILELIST=`ls`
FileWithTimeStamp=/tmp/file_$(/bin/date +%Y-%m-%d).txt
echo "${FileWithTimeStamp}"
