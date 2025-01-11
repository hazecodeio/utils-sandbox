CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

curl  -H "Authorization: token "${TOKEN_GITHUB}"" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -X GET \
      --url 'https://api.github.com/repos/apache/spark/tags?per_page=100' \