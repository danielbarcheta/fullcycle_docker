FROM golang:1.24-alpine as builder

WORKDIR /app

COPY go.mod .
COPY main.go .

RUN go build -ldflags="-s -w" -o fullcycle

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]
