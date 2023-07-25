# Build stage
FROM golang:alpine as build
WORKDIR /app

COPY dispatcher.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o dispatcher dispatcher.go

# Run stage
FROM alpine

EXPOSE 80
CMD ["/dispatcher"]

COPY --from=build /app/dispatcher /dispatcher
COPY static /static/

