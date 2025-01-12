# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests
CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

BOARD_ID="5f21eea50f40e30520c6cda3"

curl  -H "Authorization: OAuth oauth_consumer_key=\"${TRELLO_KEY}\", oauth_token=\"${TRELLO_TOKEN}\"" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -X GET \
      --URL "https://api.trello.com/1/boards/"${BOARD_ID}"/cards" \
      | jq \
#      | jq --arg BOARD_NAME "${BOARD_NAME}" \
#      '.[] | select(.name == $BOARD_NAME) | {name: .name, id: .id}'