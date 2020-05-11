#!/usr/bin/env bash

for file in ./*.sh;do
  if [[ $file =~ $0 ]];then
    continue
  fi
  printf "====================%s========================\n" "$file"
  bash "$file"
  printf "********************%s************************\n" "$file"
  shellcheck "$file"
done 
