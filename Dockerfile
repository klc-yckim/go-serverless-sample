FROM golang:1.22 AS builder

WORKDIR /go/src/app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -tags lambda.norpc -a -installsuffix cgo -o main ./cmd/app

FROM public.ecr.aws/lambda/provided:al2023

COPY --from=builder /go/src/app/main .

ENTRYPOINT ["./main"]