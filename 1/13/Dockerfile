FROM golang:1.16.15

WORKDIR /usr/src/app

COPY go* .

RUN go mod download

COPY . .

RUN go build

RUN chmod +x ./server

EXPOSE 8080

CMD ./server