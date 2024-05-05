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

defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock
