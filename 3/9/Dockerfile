# build stage
FROM golang:1.16.15 as builder

WORKDIR /usr/src/app

COPY go* .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -ldflags '-w -s' -o server.exe


# run stage
FROM scratch

COPY --from=builder /usr/src/app/server.exe ./server.exe

EXPOSE 8080

CMD ["./server.exe"]
