#!/bin/bash

file=$1
echo $file
while read line
do
    echo $line
done < $file
