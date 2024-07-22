#!/bin/bash

# File: update_changelog.sh

# Check if the commit message is passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 '<commit_message>'"
  exit 1
fi

COMMIT_MESSAGE="$1"
CHANGELOG_FILE="CHANGELOG.md"

# Insert the commit message under the topmost version tag
awk -v msg="$COMMIT_MESSAGE" '
  BEGIN { found_version_tag = 0 }
  /^## [0-9]+\.[0-9]+\.[0-9]+(-main\.[0-9]+)?$/ {
    if (found_version_tag == 0) {
      found_version_tag = 1
      print $0
      print ""
      print " - " msg
      next
    }
  }
  { print $0 }
' "$CHANGELOG_FILE" > "${CHANGELOG_FILE}.tmp" && mv "${CHANGELOG_FILE}.tmp" "$CHANGELOG_FILE"
