#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Sort Launchpad
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author ganajayant
# @raycast.authorURL https://raycast.com/ganajayant

rm -rf /Applications/Google\ Docs.app && rm -rf /Applications/Google\ Slides.app && rm -rf /Applications/Google\ Sheets.app && defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock
