# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests
CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

CARD_ID=xDLppR3n

curl  -H "Authorization: OAuth oauth_consumer_key=\"${KEY_TRELLO}\", oauth_token=\"${TOKEN_TRELLO}\"" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -X DELETE \
      --url "https://api.trello.com/1/cards/"${CARD_ID}"" \
#      | jq \
#      | jq '{comments: .badges.comments}'