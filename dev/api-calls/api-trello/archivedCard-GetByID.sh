# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests
CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

BOARD_ID=Tc9Cdnbv
FILTER=closed
# Valid values: all, closed, none, open, visible
# closed == archived

curl  -H "Authorization: OAuth oauth_consumer_key=\"${KEY_TRELLO}\", oauth_token=\"${TOKEN_TRELLO}\"" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -X GET \
      --url "https://api.trello.com/1/boards/${BOARD_ID}/cards/${FILTER}" \
      | jq \
#      | jq '.[].closed'