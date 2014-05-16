#!/bin/bash

exit 1

# 1 run ichtowav

sudo ./monc/ichtowav.sh ./bin ./ich15 

#2 run wav2raw
sudo ./monc/wav2raw.sh ./ich15/ ./cfg

# run cut.sh

sudo ./monc/cut.sh ./bin ./ich15/ ./splite/
