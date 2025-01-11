CWD=$(echo $(realpath "${0}") | xargs dirname)
#echo "${CWD}"
source "${CWD}"/_env-loader.sh

curl  -H "Authorization: token "${TOKEN_GITHUB}"" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -X GET \
      --url 'https://api.github.com/user/repos' \