CWD=$(echo $(realpath "${0}") | xargs dirname)
source "${CWD}"/_env-loader.sh

#"id": '"${WORKSPACE_ID}"',
#"organization_id": 4535479
#"name": "HazeWS"


curl -v -u "${TOKEN_TOGGL}" \
	-X GET 'https://api.track.toggl.com/api/v9/workspaces/'"${WORKSPACE_ID}"'' \
  | jq  '.'
