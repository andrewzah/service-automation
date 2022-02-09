#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER librephotos;
    ALTER USER librephotos WITH CREATEDB;

    CREATE DATABASE librephotos;
    GRANT ALL PRIVILEGES ON DATABASE librephotos TO librephotos;
EOSQL
