#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title lunar
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 💡
# @raycast.argument1 { "type": "text", "placeholder": "level (0-100)" }

# Documentation:
# @raycast.author Gal Tashma
# @raycast.authorURL https://github.com/bitterbit

LUNAR=$(which lunar)

if [ -z $LUNAR ]; then
    echo "lunar not installed"
    exit 1
fi

$LUNAR preset $1
