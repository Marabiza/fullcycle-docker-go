# Etapa de build
FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY main.go .

RUN go build -ldflags="-s -w" -o fullcycle

# Etapa final
FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]
