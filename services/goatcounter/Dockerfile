FROM registry.access.redhat.com/ubi8/ubi-minimal as build

WORKDIR /build

RUN microdnf install -y git golang

#RUN dnf install -y \
#  gcc-c++ \
#  git \
#  glibc-devel \
#  golang \
#  make \
#  pkg-config \
#  sqlite-devel

ARG GOATCOUNTER_VERSION
RUN git clone 'https://github.com/zgoat/goatcounter.git' /build/goatcounter

WORKDIR /build/goatcounter
RUN go get -u ./...

ENV CGO_ENABLED "0"

RUN go build \
  -ldflags="-X zgo.at/goatcounter.Version=$(git log -n1 --format='%h_%cI')" \
  ./cmd/goatcounter

FROM registry.access.redhat.com/ubi8/ubi-minimal

COPY --from=build /build/goatcounter/goatcounter /bin/
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

