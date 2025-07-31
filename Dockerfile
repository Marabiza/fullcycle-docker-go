# Etapa 1: build da aplicação
FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY main.go .

RUN go build -ldflags="-s -w" -o fullcycle

# Etapa 2: imagem final minimalista
FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]
