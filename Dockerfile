FROM golang:1.12-buster
RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /app --shell /sbin/nologin \
    --disabled-password app

RUN mkdir /app/statics/
ADD statics /app/statics/

ADD . /go/src/github.com/gushu-learner/invoicer
RUN go install github.com/gushu-learner/invoicer

USER app
EXPOSE 8080
WORKDIR /app
ENTRYPOINT /go/bin/invoicer
