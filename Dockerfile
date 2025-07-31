FROM golang:1.21 AS builder

WORKDIR /app
COPY . .

RUN go build -ldflags="-s -w" -o fullcycle

FROM scratch
COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]