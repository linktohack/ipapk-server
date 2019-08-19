FROM golang AS builder
COPY ./go /go
WORKDIR /go/src/github.com/linktohack/ipapk-server
RUN make linux

FROM golang
RUN mkdir -p /ipapk
WORKDIR /ipapk
COPY --from=builder /go/src/github.com/linktohack/ipapk-server/ipapk-server-v1.0.0-linux-amd64 ipapk-server
COPY --from=builder /go/src/github.com/linktohack/ipapk-server/config.json .
COPY --from=builder /go/src/github.com/linktohack/ipapk-server/public ./public
CMD /ipapk/ipapk-server
