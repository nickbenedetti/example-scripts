#!/bin/bash
# Get repo list from Github with 'gh repo list <org-name> --json name -L 1000 | jq -r '.[].name' > repo-list.json'
# jq organizes and cleans the output into a list of quote delimited strings
# Update repo names as desired and format as seen below:
OLD_NEW_NAMES=( "old-1" "new-1" "old-2" "new-2")

for ((i=0; i<${#OLD_NEW_NAMES[@]}; i+=2)); do
	OLD="${OLD_NEW_NAMES[i]}"
	NEW="${OLD_NEW_NAMES[i+1]}"
	OWNER="<owner>"
	echo "Repo formerly named ${OLD}"
	gh repo rename -R "${OWNER}"/"${OLD}" "${NEW}"
done

# Output should be:
# Repo formerly named old-1
# ✓ Renamed repository <owner>/new-1
# Repo formerly named old-2
# ✓ Renamed repository <owner>/new-2