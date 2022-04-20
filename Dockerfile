FROM alpine:3

RUN apk update && apk add curl git go && rm -rf /var/cache/apk/*

ENV GOROOT /usr/lib/go
ENV GOPATH /gopath
ENV GOBIN /gopath/bin
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

WORKDIR /gopath/src/github.com/mattmanning/geoip

COPY geoip.go /gopath/src/github.com/mattmanning/geoip

RUN go mod init
RUN go get github.com/gorilla/mux
RUN go get github.com/oschwald/geoip2-golang
RUN go install ./...

COPY entrypoint.sh /

EXPOSE 8080

CMD ["/entrypoint.sh"]
