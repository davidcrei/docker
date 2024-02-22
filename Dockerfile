FROM  golang:alpine AS builder

WORKDIR /go/src/app

COPY main.go .

RUN go build -o app main.go

FROM scratch
WORKDIR /go/src/app

COPY --from=builder /go/src/app .

CMD ["./app"]