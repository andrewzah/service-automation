#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER sauertracker;
    ALTER USER sauertracker WITH CREATEDB;

    CREATE DATABASE sauertracker;
    GRANT ALL PRIVILEGES ON DATABASE sauertracker TO sauertracker;
EOSQL
