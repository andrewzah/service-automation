#!/bin/bash

export COMPOSE_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$COMPOSE_ROOT"

export COMPOSE_PROJECT_NAME=andrewzah

if [ ! -z "$IGNORED_SERVICES" ]; then
  export COMPOSE_FILE="$(ls -1 services/*/compose.yml | grep -v -E "${IGNORED_SERVICES}" | paste -sd ":" -)"
else
  export COMPOSE_FILE="$(ls -1 services/*/compose.yml | paste -sd ":" -)"
fi

echo $COMPOSE_FILE

docker-compose "$@"
