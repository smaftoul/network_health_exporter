FROM golang:1.9-alpine3.6 as builder
RUN apk add --update git  go get github.com/obohrer/network_health_exporter

FROM alpine:3.6
COPY --from=builder /go/bin/network_health_exporter .
EXPOSE 9106
ENTRYPOINT ./network_health_exporter
