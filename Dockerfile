
FROM --platform=linux/amd64 golang:1.17-alpine as prep
RUN apk --update add ca-certificates alpine-sdk linux-lts-dev
RUN mkdir -p /tmp
ENV GOARCH=amd64
ENV CGO_ENABLED=0
RUN GO111MODULE=on go install go.opentelemetry.io/collector/cmd/builder@v0.56.0 
COPY builder.yml /tmp/builder.yml
RUN builder --config /tmp/builder.yml

FROM scratch
ARG USER_UID=10001
USER ${USER_UID}
COPY --from=prep /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=prep /tmp/bin/customcollector customcollector
EXPOSE 4317 4318 8126
ENTRYPOINT ["/customcollector"]
CMD ["--config", "/conf/otel-collector-config.yaml"]