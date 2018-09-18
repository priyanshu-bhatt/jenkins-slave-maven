FROM maven:3-jdk-8
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

USER root

RUN apt-get update && \
    apt-get install -y git subversion mercurial wget curl unzip ca-certificates procps bash && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 10000 jenkins && \
    useradd -c "Jenkins user" --gid 10000 -d /home/jenkins -m jenkins && \
    usermod -g jenkins jenkins && \
    echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

ENV USER_HOME_DIR /home/jenkins
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
RUN ./usr/local/bin/mvn-entrypoint.sh

WORKDIR /home/jenkins

CMD ["/bin/bash"]