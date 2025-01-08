# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests

# NOTE: Mus be performed from the browser

CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

curl  -H 'Accept: application/json' \
      -X GET \
      --url "https://trello.com/1/authorize?expiration=never&scope=read,write,account&response_type=token&key=${KEY_TRELLO}" \
#      | jq