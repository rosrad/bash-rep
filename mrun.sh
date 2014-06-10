#!/bin/bash
#some functions to run matlab script in a console terminal. 

m_log=~/work/tmp/matlab.log
run_matlab() {
    pwd=`pwd`
    echo "run matlab $@"
    cmd="addpath ${pwd} ; addpath /home/14/ren/source/matlab/config;"
    wrap="'$@'"
    matlab -nojvm -nodisplay -nosplash -r "${cmd};adddirs();wrap_template(${wrap});exit" -logfile $m_log
}

run_matlab $@



