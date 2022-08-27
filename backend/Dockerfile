FROM golang:1.14-alpine as builder

RUN apk update && apk upgrade && \
    apk --no-cache --update add git make && \
    go get github.com/gorilla/mux

WORKDIR /
COPY . .
RUN go mod init main
RUN go mod tidy
RUN go build -o main main.go
RUN rm -rf /var/cache/apk/*

FROM alpine:latest

RUN apk fix && \
    apk add --no-cache \ 
    tzdata \
    curl
    
ENV TZ=Asia/Jakarta

RUN rm -rf /var/cache/apk/*
RUN mkdir -p /app
WORKDIR /app
EXPOSE 8080
COPY --from=builder /main /app/
CMD ["./app/main"]
