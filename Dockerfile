FROM golang:1.13-buster AS builder

COPY . /src
RUN cd /src && \
    CGO_ENABLED=0 GOOS=linux go build -o sample main.go

FROM alpine:3.10.3
RUN apk add --no-cache ca-certificates

COPY --from=builder /src/sample /usr/local/bin/sample
EXPOSE 8080
CMD ["/usr/local/bin/sample"]