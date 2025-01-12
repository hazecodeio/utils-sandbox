# https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/#passing-token-and-key-in-api-requests
CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

./board-GetBoards.sh \
      | jq -cr '.[] | {name: .name, id: .id, shortLink: .shortLink}' | jq -s