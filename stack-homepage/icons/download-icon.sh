#!/usr/bin/env bash

# Check if a parameter was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <icon_name>"
    exit 1
fi

ICON_NAME="$1"
URL="https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/${ICON_NAME}.png"

# Use wget to download the icon
wget "$URL"

if [ $? -ne 0 ]; then
    echo "Failed to download ${ICON_NAME}.png"
    exit 2
fi

echo "${ICON_NAME}.png downloaded successfully."
