# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests
CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

BOARD_NAME="QueerFolxCode-Tracking"
BOARD_ID="5f21eea50f40e30520c6cda3"
LIST_NAME="Dump"
LIST_ID="62978c0194afec07a10b04d3"


FIELDS=id,name,url,idOrganization,idBoard,closed
FILTER=closed

curl  -H "Authorization: OAuth oauth_consumer_key=\"${TRELLO_KEY}\", oauth_token=\"${TRELLO_TOKEN}\"" \
      --URL "https://api.trello.com/1/boards/${BOARD_ID}/lists/${FILTER}?fields=${FIELDS}" \
      | jq \
