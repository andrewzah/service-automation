#!/bin/bash

set -exo pipefail

BIN_PATH='/home/eas/app/bin'
SCRIPT_PATH=${1?Specify the script path as the first argument.} 

if ! docker ps | grep -q "external-auth-server"; then
  echo "External Auth Server is not running?"
fi

CONTAINER=$(docker ps | grep eas | awk '{print $1}')

docker cp "$SCRIPT_PATH" "${CONTAINER}:$BIN_PATH/token-gen.js"

echo "Generating EAS token via $SCRIPT_PATH"
docker exec -w "$BIN_PATH" "$CONTAINER" node "token-gen.js"
