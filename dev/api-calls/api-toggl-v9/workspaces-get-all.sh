CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

#"id": 4561855,
#"organization_id": 4535479
#"name": "HazeWS"


curl -v -u "${TOKEN_TOGGL}" \
	-X GET 'https://api.track.toggl.com/api/v9/workspaces' \
  | jq  '.[]'
