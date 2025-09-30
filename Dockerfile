#
# Dockerfile for derper
#

FROM golang:alpine AS builder

RUN set -ex \
  && go install tailscale.com/cmd/derper@latest

FROM alpine

RUN apk add --no-cache ca-certificates

COPY --from=builder /go/bin/* /usr/local/bin/

ENTRYPOINT ["derper"]
