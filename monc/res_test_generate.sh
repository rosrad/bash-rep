#!/bin/bash
indir=`readlink -e $1`
outdir=`readlink -e $2`
res_test_file=$outdir/res_test.list
ori_test_file=$outdir/ori_test.list
rm -f $res_test_file
rm -f $ori_test_file
touch $res_test_file
touch $ori_test_file

for name in `ls $indir|egrep *\.list$`
do
    echo "generate test of list :" $name
    base=`echo $name |cut -d'.' -f1`
    echo "generate base : " $base
    file=${indir}/$name
    max_lines=`cat ${file}|wc -l`
    echo "max lines : " $max_lines
    index=1
    for line in `cat $file|cut -d' ' -f1`
    do
	if [ $index -eq 1 -o $index -eq 35 -o $index -eq $max_lines ] 
	    then
	    echo line:  $line
	    test_name=`echo $line|cut -d'/' -f6`
	    res_path=`readlink -e ${indir}/../splite/${base}/wavech1/$test_name`
	    echo res test : $res_path
	    echo $line >>  $ori_test_file
	    echo $res_path >> $res_test_file
	fi
	index=`expr $index + 1`
    done
done
