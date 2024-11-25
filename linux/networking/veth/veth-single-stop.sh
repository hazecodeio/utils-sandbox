#!/bin/bash

#Bash Strict Mode
set -euo pipefail

CWD=$(echo $(realpath $0) | xargs dirname)
source "${CWD}"/_env-loader.sh

#Appending to existing NetworkManager config file: /etc/NetworkManager/conf.d/unmanaged.conf

sudo ip link delete "${LINK}"
sudo ip netns delete "${NS}"
sudo nmcli connection reload