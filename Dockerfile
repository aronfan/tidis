FROM golang:1.10.1-alpine as builder

RUN apk add --no-cache make git

COPY . /go/src/github.com/aronfan/tidis

WORKDIR /go/src/github.com/aronfan/tidis/

RUN make

FROM scratch
COPY --from=builder /go/src/github.com/aronfan/tidis/bin/tidis-server /tidis-server

WORKDIR /

EXPOSE 5379

ENTRYPOINT ["/tidis-server"]

