CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

curl  -H "Authorization: token "${GITHUB_TOKEN}"" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -X GET \
      --URL 'https://api.github.com/repos/apache/spark/tags?per_page=100' \
