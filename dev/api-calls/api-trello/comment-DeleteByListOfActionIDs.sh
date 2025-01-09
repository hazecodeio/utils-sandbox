# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests
# https://developer.atlassian.com/cloud/trello/rest/api-group-cards/#api-cards-id-actions-get
# https://developer.atlassian.com/cloud/trello/guides/rest-api/action-types/
# https://developer.atlassian.com/cloud/trello/guides/rest-api/nested-resources/

# https://developer.atlassian.com/cloud/trello/rest/api-group-cards/#api-cards-id-actions-idaction-comments-delete

CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

CARD_ID=ee6N8GbE
ACTIONS_LIMIT=10


OUT="$(curl  -H "Authorization: OAuth oauth_consumer_key=\"${KEY_TRELLO}\", oauth_token=\"${TOKEN_TRELLO}\"" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -X GET \
      --url "https://api.trello.com/1/cards/"${CARD_ID}"?fields=id&actions=commentCard,text&actions_limit=${ACTIONS_LIMIT}" \
      | jq -cr '.actions.[].id')"

echo $OUT | jq -crR 'split(" ")'

for idAction in $OUT
do
  curl  -H "Authorization: OAuth oauth_consumer_key=\"${KEY_TRELLO}\", oauth_token=\"${TOKEN_TRELLO}\"" \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -X DELETE \
        --url "https://api.trello.com/1/cards/"${CARD_ID}"/actions/"${idAction}"/comments"
done

./comment-GetCommentsCount.sh