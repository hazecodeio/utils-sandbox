CWD=$(echo $(realpath $0) | xargs dirname)
source $CWD/_env-loader.sh

curl -i -H "Authorization: token $TOKEN_IG" 'https://api.github.com/user/repos'
