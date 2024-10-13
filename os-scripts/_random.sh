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