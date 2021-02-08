#!/bin/bash

set -ex

backups_dir="/home/andrew/docker/data/postgres_backups"

rsync \
  --verbose \
  --progress \
  --human-readable \
  --recursive \
  --owner \
  --group \
  --chown 1005:1005 \
  "${backups_dir}/" \
  "/mnt/data/postgres_backups"
