#!/bin/bash
indir=`readlink -e $1`
outdir=`readlink -e $2`
test_file=$outdir/ori_test.list
rm -f $test_file
touch $test_file

for name in `ls $indir|egrep *\.list$`
do
    echo "generate test of list :" $name
    file=${indir}/$name
    max_lines=`cat ${file}|wc -l`
    echo "max lines : " $max_lines
    index=1
    for line in `cat $file|cut -d' ' -f1`
    do
	if [ $index -eq 1 -o $index -eq 35 -o $index -eq $max_lines ] 
	    then
	    echo line:  $line
	    echo $line >> $test_file
	fi
	index=`expr $index + 1`
    done
done
