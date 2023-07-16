#!/bin/bash

# Set your GitHub username and access token here
username="youssef-attai"

# Get the number of unread notifications for the authenticated user
count=$(curl -s -u "$username:$GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" "https://api.github.com/notifications?participating=false" | jq '. | length')

# Print the number of notifications to stdout
echo "$count"

