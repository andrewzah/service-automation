#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER lychee;
    ALTER USER lychee WITH CREATEDB;

    CREATE DATABASE lychee;
    GRANT ALL PRIVILEGES ON DATABASE lychee TO lychee;
EOSQL
