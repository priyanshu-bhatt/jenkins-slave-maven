FROM maven:alpine
LABEL maintainer="Julian Nonino <noninojulian@outlook.com>"

RUN apk add --no-cache git openssh subversion mercurial wget curl unzip && \
    rm -rf /var/cache/apk/*

RUN mkdir /ws
WORKDIR /ws

CMD ["/bin/sh"]