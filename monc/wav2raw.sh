#!/bin/bash

in=`readlink -e $1`
cfg=`readlink -e $2`

echo input dir  : $in
echo cfg : $cfg
index=0
cur=`pwd`
for line in `cat $cfg`
do 
    echo clip time : $line
    echo index $index
    wav_dir=$in/merge${index}_wav/
    echo merge : $wav_dir
    cd $wav_dir
    for file in `ls ${wav_dir}|egrep ".*.wav$"`
    do
	echo "wavefile $file"
	base=`echo $file | cut -d'.' -f 1`
	out=$base.raw
	echo $out
	trim=${base}.trm.wav
	echo trim =  $trim
	sox $file $trim trim 00:${line}
	sox --encoding signed-integer --bits 16 --rate 16k --endian little --channels 1 $trim $out
    done
    index=`expr $index + 1`
done
