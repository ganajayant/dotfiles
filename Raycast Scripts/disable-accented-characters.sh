#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Disable Accented Characters
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author ganajayant
# @raycast.authorURL https://raycast.com/ganajayant

defaults write -g ApplePressAndHoldEnabled -bool false
