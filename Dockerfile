FROM golang:1.22 AS builder

WORKDIR /go/src/app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM amazonlinux:2

WORKDIR /root/

COPY --from=builder /go/src/app/main .

ENTRYPOINT ["./main"]