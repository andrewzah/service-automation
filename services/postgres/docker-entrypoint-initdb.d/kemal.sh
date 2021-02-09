#!/bin/bash

set -ex

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER kemal;
    ALTER USER kemal WITH CREATEDB;

    CREATE DATABASE invidious;
    GRANT ALL PRIVILEGES ON DATABASE invidious TO kemal;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "invidious" < /config/sql/channels.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "invidious" < /config/sql/videos.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "invidious" < /config/sql/channel_videos.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "invidious" < /config/sql/users.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "invidious" < /config/sql/session_ids.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "invidious" < /config/sql/nonces.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "invidious" < /config/sql/annotations.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "invidious" < /config/sql/playlists.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "invidious" < /config/sql/playlist_videos.sql
