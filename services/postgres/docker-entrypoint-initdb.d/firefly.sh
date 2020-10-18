#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER firefly;
    ALTER USER firefly WITH CREATEDB;

    CREATE DATABASE firefly;
    GRANT ALL PRIVILEGES ON DATABASE firefly TO firefly;
EOSQL
