#!/bin/bash
bin=`readlink -e $1`
in=`readlink -e $2`
out=`readlink -e $3`
for index in `seq 0 12`
do
    base=merge${index}
    echo base: $base
    $bin/mergewave -i $in/${base}_wav  -o $out/${base}/ -m 2
done
