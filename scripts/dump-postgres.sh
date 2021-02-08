#!/bin/bash

set -ex

compose_dir="/home/andrew/docker"
filename="$(date +%Y-%m-%d_%H-%M-%S).psql.gz"

cd "${compose_dir}"

./compose.sh exec \
    -w / \
    -u postgres \
  postgres \
    bash \
      -c "pg_dumpall | gzip > '/postgres_backups/${filename}'"
