FROM golang AS builder
COPY ./go /go
WORKDIR /go/src/github.com/sharljimhtsin/ipapk-server-fixed-pkg-error
RUN make linux

FROM golang
RUN mkdir -p /ipapk
WORKDIR /ipapk
COPY --from=builder /go/src/github.com/sharljimhtsin/ipapk-server-fixed-pkg-error/ipapk-server-v1.0.0-linux-amd64 ipapk-server
COPY --from=builder /go/src/github.com/sharljimhtsin/ipapk-server-fixed-pkg-error/config.json .
COPY --from=builder /go/src/github.com/sharljimhtsin/ipapk-server-fixed-pkg-error/public ./public
CMD /ipapk/ipapk-server
