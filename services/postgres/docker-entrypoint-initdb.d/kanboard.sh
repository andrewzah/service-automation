#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER kanboard;
    ALTER USER kanboard WITH CREATEDB;

    CREATE DATABASE kanboard;
    GRANT ALL PRIVILEGES ON DATABASE kanboard TO kanboard;
EOSQL
