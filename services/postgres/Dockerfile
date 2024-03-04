FROM docker.io/library/postgres:15.6-bullseye@sha256:5a797781cce81d545d49f09bd4b6384395bdf5ceaf714476e642cded99b4b600

ENV PG_CONFIG /usr/lib/postgresql/15/bin/pg_config

RUN apt-get update \
  && apt-get install -y postgresql-15-pgvector \
  && apt-get clean \
  && rm -rf \
    /var/cache/apt/archives \
    /var/lib/apt/lists/*
