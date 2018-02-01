# v0.1 - 2018-02-01 - Use multi-stage builds
#        https://docs.docker.com/engine/userguide/eng-image/multistage-build/#use-multi-stage-builds
#        Requirement: Multi-stage builds are a new feature requiring Docker 17.05+

FROM golang:latest
RUN go get github.com/krallistic/kafka-prometheus-exporter/main
WORKDIR /go/src/github.com/krallistic/kafka-prometheus-exporter/main
RUN CGO_ENABLED=0 GOOS=linux go build -o kafka_exporter -a -ldflags '-extldflags "-static"' .

FROM alpine:latest
MAINTAINER Jazz Wang <jazzwang.tw@gmail.com>

EXPOSE 9309

COPY --from=0 /go/src/github.com/krallistic/kafka-prometheus-exporter/main/kafka_exporter /usr/bin/kafka_exporter

CMD ["/usr/bin/kafka_exporter -h"]
