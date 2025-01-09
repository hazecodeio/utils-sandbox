# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests
CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

CARD_ID=ugJwkxmU
CARD_ID=UAHsXfjc
CARD_ID=SvJ6mWD9

CARD_ID=ojNqvWxB
CARD_ID=ee6N8GbE

curl  -H "Authorization: OAuth oauth_consumer_key=\"${KEY_TRELLO}\", oauth_token=\"${TOKEN_TRELLO}\"" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -X GET \
      --url "https://api.trello.com/1/cards/"${CARD_ID}"" \
      | jq \
#      | jq '{comments: .badges.comments}'