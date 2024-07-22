#!/bin/bash

# Get version type from input
version_type=$1 # "main" or "stable"

# Determine the correct version suffix
if [ "$version_type" == "main" ]; then
  version_suffix="-main.1"
else
  version_suffix=""
fi

# Process CHANGELOG.md based on version type
if [ "$version_type" == "main" ]; then
  # For 'main' version type, ensure all versions without '-main.1' get the suffix
  # Do not add '-main.1' if it's already present
  awk -v suffix="$version_suffix" '
  BEGIN { RS="## "; FS="\n" }
  {
    version = $1
    rest = substr($0, length(version) + 1)
    if (version ~ /^[0-9]+\.[0-9]+\.[0-9]+$/ && version !~ suffix) {
      gsub(/^[0-9]+\.[0-9]+\.[0-9]+/, "&" suffix, version)
    }
    print "## " version rest
  }
  ' CHANGELOG.md > CHANGELOG.md.tmp
  mv CHANGELOG.md.tmp CHANGELOG.md

  # Ensure no duplicate '-main.1' suffix
  sed -i.bak -E "s/(-main\.1)(-main\.1)+/\1/" CHANGELOG.md
else
  # For 'stable' version type, ensure all versions without '-main.1' do not have the suffix
  sed -i.bak -E "s/([0-9]+\.[0-9]+\.[0-9]+)-main\.1/\1/" CHANGELOG.md
fi

rm CHANGELOG.md.bak
