#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER mayan;
    ALTER USER mayan WITH CREATEDB;

    CREATE DATABASE mayan;
    GRANT ALL PRIVILEGES ON DATABASE mayan TO mayan;
    ALTER USER mayan with login;
EOSQL
