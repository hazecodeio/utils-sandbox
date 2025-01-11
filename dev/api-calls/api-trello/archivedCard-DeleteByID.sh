# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests
CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

BOARD_ID=Tc9Cdnbv
FILTER=closed
# Valid values: all, closed, none, open, visible
# closed == archived


timeStart=$(date)
countBefore=$(./comment-GetCommentsCount.sh | jq .comments)


OUT=$(./archivedCard-GetByID.sh | jq -cr '.[].id')

echo $OUT | jq -crR 'split(" ") | length'

for cardID in $OUT
do
  curl  -H "Authorization: OAuth oauth_consumer_key=\"${TRELLO_KEY}\", oauth_token=\"${TRELLO_TOKEN}\"" \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -X DELETE \
        --URL "https://api.trello.com/1/cards/"${cardID}""
done

timeEnd=$(date)

#echo ${timeStart}
#echo ${timeEnd}

echo '{}' | jq -r \
  --arg S "${timeStart}" \
  --arg E "${timeEnd}" \
  '{
      timeStart: $S,
      timeEnd: $E,
  }'