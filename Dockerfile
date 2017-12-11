FROM maven:alpine
LABEL maintainer="Julian Nonino <noninojulian@outlook.com>"

RUN apk add --no-cache git subversion mercurial wget curl unzip openssh ca-certificates && \
    rm -rf /var/cache/apk/*

RUN mkdir /ws
WORKDIR /ws

CMD ["/bin/sh"]