# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests
CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

export CHECKLIST_ID=????-

curl  -H "Authorization: OAuth oauth_consumer_key=\"${KEY_TRELLO}\", oauth_token=\"${TOKEN_TRELLO}\"" \
      -H 'Accept: application/json' \
      -X GET \
      --url "https://api.trello.com/1/checklists/{id}/checkItems" \
      | jq