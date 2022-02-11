FROM maven:3.8.4-openjdk-17
LABEL maintainer="CN Services <noninojulian@gmail.com>"

RUN apk add --no-cache git subversion mercurial wget curl unzip openssh ca-certificates procps bash && \
    rm -rf /var/cache/apk/*
    
# Update the system
RUN apt-get update -y && \
    apt-get install -y git subversion mercurial wget curl unzip build-essential ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add Jenkins Worker user and add it to sudoers and create .m2 folder the user
RUN useradd -c "Jenkins Worker user" -d /home/jenkins-worker -m jenkins-worker && \
    echo "jenkins-worker ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins-worker

ENV USER_HOME_DIR /home/jenkins-worker
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
RUN ./usr/local/bin/mvn-entrypoint.sh

WORKDIR $USER_HOME_DIR

CMD ["/bin/bash"]
