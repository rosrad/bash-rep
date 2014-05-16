#!/bin/bash
for index in `seq 0 12`
do
    cp $1/merge${index}_wav/wavech${index}.wav $2
done
