source $(dirname $0)/_env-loader.sh

curl -i -H "Authorization: token $TOKEN_IG" 'https://api.github.com/repos/apache/spark/tags?per_page=100'
