#!/bin/bash

path=${1-"./"}
ext=${2-"wav"}
#set -x
for dir in ${path}/*
do
    if [ -d $dir ]; then
	echo "$dir"
	dirname=$(basename $dir)
	find $dirname -type f -iname "*.${ext}" |sort|uniq> ${dirname}.list
	
    fi
done    
#set +x
