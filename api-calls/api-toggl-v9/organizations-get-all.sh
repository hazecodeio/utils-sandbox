CWD=$(echo $(realpath $0) | xargs dirname)
source $CWD/_env-loader.sh

#"id": 4535479,
#"name": "HazeOrg"

curl -v -u "$TOKEN_TOGGL" \
	-X GET 'https://api.track.toggl.com/api/v9/me/organizations'
