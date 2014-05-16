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
