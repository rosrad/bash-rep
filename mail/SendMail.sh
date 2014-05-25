#!/bin/bash -u
if [ $# -gt 1 ]; then
    echo "too many parameters!"
elif [ $# -lt 1 ]; then
    echo "too little parameters!"
else
    mail=$MAIL_SENDER/`basename $1`.mail
    echo "move to ${mail}"
    cp $1 $mail
fi	
