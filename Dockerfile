FROM golang:1.16-alpine as base

WORKDIR /go/app
COPY . .
RUN go build helloWorld.go
 
FROM scratch
WORKDIR /go/app
COPY --from=base /go/app .
ENTRYPOINT [ "./helloWorld" ]
