FROM golang:1.14-alpine

RUN apk add git

# copy source
COPY ./src /go/src/api-go

WORKDIR /go/src/api-go

RUN ls -lisah

RUN go mod download
RUN go mod verify

WORKDIR /go/src/api-go


RUN go get github.com/githubnemo/CompileDaemon

ENTRYPOINT CompileDaemon --build="go build /go/src/api-go/main.go" --command=./main