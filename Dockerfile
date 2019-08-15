FROM golang
RUN mkdir -p /ipapk
WORKDIR /ipapk
COPY ipapk-server-v1.0.0-linux-amd64 ipapk-server
COPY config.json .
COPY public public
VOLUME /ipapk/.data
CMD /ipapk/ipapk-server