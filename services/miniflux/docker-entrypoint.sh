#!/bin/sh

set -ex

echo $DATABASE_URL

echo "Migrating..."
/usr/bin/miniflux -migrate

echo "Starting up miniflux"
exec /usr/bin/miniflux 
