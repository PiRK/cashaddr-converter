FROM golang:alpine
RUN mkdir -p /go/src/github.com/PiRK/cashaddr-converter/
WORKDIR /go/src/github.com/PiRK/cashaddr-converter/
COPY . .
RUN go install github.com/PiRK/cashaddr-converter/cmd/svc
FROM alpine
COPY --from=0 /go/bin/svc /svc
COPY --from=0 /go/src/github.com/PiRK/cashaddr-converter/static /static
CMD ["/svc"]