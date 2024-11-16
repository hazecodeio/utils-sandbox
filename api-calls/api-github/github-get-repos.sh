source $(dirname $0)/_env-loader.sh

curl -i -H "Authorization: token $TOKEN_GITHUB" 'https://api.github.com/user/repos'

#echo $(dirname $0)