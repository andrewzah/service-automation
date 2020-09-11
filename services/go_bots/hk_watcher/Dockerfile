FROM golang:1.15-alpine

WORKDIR /build

COPY go.mod go.mod
COPY main.go main.go

RUN go build main.go \
  && mv ./main /usr/local/bin/bot

WORKDIR /

CMD ["/usr/local/bin/bot"]
