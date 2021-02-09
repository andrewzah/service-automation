#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER authelia;
    ALTER USER authelia WITH CREATEDB;

    CREATE DATABASE authelia;
    GRANT ALL PRIVILEGES ON DATABASE authelia TO authelia;
EOSQL
