#!/bin/bash
export COMPOSE_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$COMPOSE_ROOT"

export COMPOSE_PROJECT_NAME=andrewzah
export COMPOSE_FILE="$(ls -1 services/*/compose.yml | paste -sd ":" -)"

docker-compose "$@"
