#!/bin/bash

# Extract the current version from pubspec.yaml
current_version=$(grep '^version: ' pubspec.yaml | awk '{print $2}')
version_type=$1 # "main" or "stable"

# Increment the version
IFS='.-' read -ra ver <<< "$current_version"
if [ "$version_type" == "main" ]; then
  new_version="${ver[0]}.${ver[1]}.$((ver[2] + 1))-main.1"
else
  new_version="${ver[0]}.${ver[1]}.$((ver[2] + 1))"
fi

# Update the pubspec.yaml
sed -i.bak "s/^version: .*/version: $new_version/" pubspec.yaml
rm pubspec.yaml.bak

# Update the README file based on version type
if [ "$version_type" == "main" ]; then
  sed -i.bak "s/^# equatable_macro (Pre-release:.*/# equatable_macro (Pre-release: $new_version)/" README-main.md
  sed -i.bak "s/^  equatable_macro: .*/  equatable_macro: ^$new_version/" README-main.md
  rm README-main.md.bak
else
  sed -i.bak "s/^# equatable_macro.*/# equatable_macro/" README-stable.md
  sed -i.bak "s/^  equatable_macro: .*/  equatable_macro: ^$new_version/" README-stable.md
  rm README-stable.md.bak
fi

echo "Bumped version to $new_version"
