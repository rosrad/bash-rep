#!/bin/bash
for index in `seq 0 12`
do
    out=$2/wavech${index}
    mkdir -p $out
    cp $1/merge*/wavech${index}/* $out
    ls $out |wc -l
done
