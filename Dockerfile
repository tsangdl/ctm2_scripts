FROM golang:1.14.9-alpine
RUN mkdir /build
ADD go.mod go.sum hello.go /build/
WORKDIR /build
RUN go build

# Multistage docker build to get image size down

## Label initial image as builder
#FROM golang:1.14.9-alpine AS builder
#RUN mkdir /build
#ADD go.mod go.sum hello.go /build/
#WORKDIR /build
#RUN go build 
#
## Now use a different base image
#FROM alpine
#RUN adduser -S -D -H -h /app appuser
#USER appuser
#COPY --from=builder /build/helloworld /app/
##COPY views/ /app/views
#WORKDIR /app
#CMD ["./helloworld"]
