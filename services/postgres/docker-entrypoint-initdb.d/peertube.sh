#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER peertube;
    ALTER USER peertube WITH CREATEDB;

    CREATE DATABASE peertube;
    GRANT ALL PRIVILEGES ON DATABASE peertube TO peertube;
EOSQL
