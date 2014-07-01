#!/bin/sh
function join_subdirs () {
    if [ -d "$1" ]
    then 
        echo   `find $1 -type d -print |awk 'BEGIN{ORS=":"}{print $0}'`
    fi
    exit 0
}
function realpath () {
    if [ -n "$1" ] ; then
        readlink -m $1
    fi
} 
#for test
#join_subdirs  $(dirname $(which gcc))


function subdirs () {
    find $(realpath $1) -path "*/.*" -prune -o -type d -print
}
function subdirs2path () {
    subdirs $1 |awk 'BEGIN { ORS = ":";} {print $1}'
}
find_in_dir() {
    if [ $# -lt 2 ]; then
	echo "no enough parameters!"
	exit 0
    fi

    path=$1
    content=$2
    if [ $# -eq 3 ] && [ $3 -ne 0 ]; then
	find $path -type f |xargs grep -i "${content}"|awk -F: '{print $1,$2}'|sort|uniq
    else
	find $path -type f |xargs grep -i "${content}"|awk -F: '{print $1}'|sort|uniq
    fi	
}
