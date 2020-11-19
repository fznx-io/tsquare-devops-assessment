FROM golang:1.15.5-alpine3.12

RUN apk add --no-cache bash git openssh
RUN go get -u github.com/gorilla/mux
RUN go get -u github.com/go-sql-driver/mysql

ADD . /app
WORKDIR /app

RUN go build -o ./out/tsquare-apis .

EXPOSE 8000

CMD ["./out/tsquare-apis"]
