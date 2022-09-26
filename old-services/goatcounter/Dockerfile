FROM golang:alpine3.12 as goatcounter_builder

WORKDIR /build

RUN apk add --virtual .build-deps build-base git \
  && git clone https://github.com/zgoat/goatcounter.git \
  && cd goatcounter \
  && go build -ldflags="-X main.version=$(git log -n1 --format='%h_%cI')" \
    -tags osusergo,netgo,sqlite_omit_load_extension \
    -ldflags='-extldflags=-static' \
    ./cmd/goatcounter \
  && apk del .build-deps \
  && rm -f /var/cache/apk/*

FROM debian:stable-slim

COPY --from=goatcounter_builder /build/goatcounter/goatcounter /usr/local/bin
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

