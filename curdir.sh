#!/bash/bash
exit 1
--canonicalize
_script="$(readlink -f ${BASH_SOURCE[0]})"
echo ${BASH_SOURCE[0]}
echo $_script
## Delete last component from $_script ##
cur_dir=$(dirname $_script)
echo $cur_dir