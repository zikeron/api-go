FROM golang:1.19.11-alpine

RUN apk add git
RUN go get github.com/githubnemo/CompileDaemon
RUN go get -u go.mongodb.org/mongo-driver

# copy source
COPY ./src /go/src/api-go

WORKDIR /go/src/api-go

RUN ls -lisah

RUN go mod download
RUN go mod verify

WORKDIR /go/src/api-go

ENTRYPOINT CompileDaemon --build="go build /go/src/api-go/main.go" --command=./main