#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER hockeypuck;
    ALTER USER hockeypuck WITH CREATEDB;

    CREATE DATABASE hockeypuck;
    GRANT ALL PRIVILEGES ON DATABASE hockeypuck TO hockeypuck;
EOSQL
