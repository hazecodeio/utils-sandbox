CWD=$(echo $(realpath $0) | xargs dirname)
source $CWD/_env-loader.sh

curl -v -u "$TOKEN_TOGGL" \
	-X GET 'https://api.track.toggl.com/api/v8/dashboard/4561855'
