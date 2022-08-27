FROM golang:1.19-alpine as builder

RUN apk update && apk upgrade && \
    apk --no-cache --update add git make 

ENV GO111MODULE=on
ENV GOFLAGS=-mod=vendor

WORKDIR /
COPY . .
RUN go mod init main
RUN go mod tidy
RUN go mod vendor
RUN go mod verify
RUN go build -o main main.go
RUN rm -rf /var/cache/apk/*

FROM alpine:latest

RUN apk fix && \
    apk add --no-cache \ 
    tzdata \
    curl
    
ENV TZ=Asia/Jakarta

RUN rm -rf /var/cache/apk/*

WORKDIR /
EXPOSE 8080
COPY --from=builder /main /
CMD ["./main"]
