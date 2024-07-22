#!/bin/bash

# Exit if any command fails
set -e

# Ensure commit message is passed as an argument
if [ -z "$1" ]; then
  echo "Error: No commit message provided."
  echo "Usage: $0 \"<commit_message>\""
  exit 1
fi

COMMIT_MESSAGE="$1"
CHANGELOG_FILE="CHANGELOG.md"

# Ensure CHANGELOG.md exists
if [ ! -f "$CHANGELOG_FILE" ]; then
  echo "Error: $CHANGELOG_FILE does not exist."
  exit 1
fi

# Find the first version tag and insert the commit message below it
sed -i "/^## [0-9]/a \ \n- $COMMIT_MESSAGE" "$CHANGELOG_FILE"

echo "Commit message added to $CHANGELOG_FILE"
