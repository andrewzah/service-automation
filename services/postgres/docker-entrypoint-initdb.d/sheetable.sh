#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER sheetable;
    ALTER USER sheetable WITH CREATEDB;

    CREATE DATABASE sheetable;
    GRANT ALL PRIVILEGES ON DATABASE sheetable TO sheetable;
EOSQL
