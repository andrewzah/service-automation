#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER tandoor_recipes;
    ALTER USER tandoor_recipes WITH CREATEDB;

    CREATE DATABASE tandoor_recipes;
    GRANT ALL PRIVILEGES ON DATABASE tandoor_recipes TO tandoor_recipes;
EOSQL
