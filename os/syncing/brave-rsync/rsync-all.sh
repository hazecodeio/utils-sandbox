CWD=$(echo $(realpath "${0}") | xargs dirname)
#echo "${CWD}"
source "${CWD}"/_env-loader.sh

find rsync*.sh -type f | xargs -i bash -c ./{}