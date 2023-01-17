# Create build stage based on buster image
FROM golang:alpine AS builder

# Criando o diretório /src
WORKDIR /src 

# Copiando arquivos *.go para o diretório
COPY *.go . 

# Run the Go build and output binary under app
RUN CGO_ENABLED=0 go build -o /app main.go

# Iniciando com scratch
FROM scratch

# copiando o binário
COPY --from=builder /app /app

# Make sure to expose the port the HTTP server is using (somente para o exemplo web: trecho comentado no programa main.go)
# EXPOSE 8080

# executando
CMD [ "/app" ]
