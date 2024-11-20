CWD=$(echo $(realpath "${0}") | xargs dirname)
#echo "${CWD}"
source "${CWD}"/_env-loader.sh

curl -i -H "Authorization: token "${TOKEN_GITHUB}"" 'https://api.github.com/user/repos'


