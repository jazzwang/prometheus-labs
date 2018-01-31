# v0.1 - 2017-12-28 - Initial version
# v0.2 - 2018-01-31 - Use multi-stage builds
#        https://docs.docker.com/engine/userguide/eng-image/multistage-build/#use-multi-stage-builds
#        Requirement: Multi-stage builds are a new feature requiring Docker 17.05+

FROM golang:latest
RUN go get github.com/V3ckt0r/fluentd_exporter
WORKDIR /go/src/github.com/V3ckt0r/fluentd_exporter/
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' .

FROM alpine:latest
MAINTAINER Jazz Wang <jazzwang.tw@gmail.com>

EXPOSE 9309

COPY --from=0 /go/src/github.com/V3ckt0r/fluentd_exporter/fluentd_exporter /usr/bin/fluentd_exporter

CMD ["/usr/bin/fluentd_exporter -h"]
