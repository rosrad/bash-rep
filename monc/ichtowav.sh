#!/bin/bash
bin=`readlink -e $1`
in=`readlink -e $2`

cur=`pwd`
for file in `ls $in|egrep \.ich$`
do 
    echo file $file
    base=`echo $file | cut -d'.' -f 1`
    echo $base
    cd $in
    $bin/ichtowav /C $file /+Y
    cd $cur
    cp $in/${base}.list $in/${base}_wav/
done

