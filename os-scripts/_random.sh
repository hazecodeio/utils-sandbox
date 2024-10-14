# Extract credentials for a pinned account
cat vault.json | jq '.vaults
      | to_entries
      | .[].value
      | select(.name == "Personal")
      | .items[]
      | select(.pinned == true)
      | .data.content
      | select(.itemUsername)
      | select(.itemUsername
      | contains("USERNAME"))
      | .password'



# Deny IPv6 for an app
sudo addgroup no-ipv6

sudo ip6tables --list
sudo ip6tables -A OUTPUT -m owner --gid-owner no-ipv6 -j DROP
sudo ip6tables --list

sudo -g no-ipv6 _COMMAND_

## Persist ip6tables changes
sudo ip6tables-save
sudo ip6tables-restore

## You can easily write a wrapper script that uses sudo for you. You can get rid of the password prompt by adding
sudo     ALL=(:no-internet)      NOPASSWD: ALL