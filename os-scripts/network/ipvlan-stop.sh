source $(dirname $0)/_env-loader.sh

sudo ip netns delete $NS

sudo nmcli connection reload