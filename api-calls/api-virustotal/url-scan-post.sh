#https://docs.virustotal.com/reference/scan-url

CWD=$(echo $(realpath $0) | xargs dirname)
source $CWD/_env-loader.sh

curl  --request POST \
      --url https://www.virustotal.com/api/v3/urls \
      --form url=gazaskygeek.com \
      --header "x-apikey: $API_KEY_VT"