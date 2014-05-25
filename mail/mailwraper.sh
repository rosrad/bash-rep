#!/bin/bash
#this is a mail checker
day=`date +%Y%m%d`
home=/home/14/ren/
dir=$home/work/tmp/mail/
mkdir -p $dir
bash /home/14/ren/source/sh/mail/checkmail.sh | tee -a $dir/mail${day}.log
exit 0
