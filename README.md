# Jenkins Slave Maven

[![](https://img.shields.io/docker/pulls/jnonino/jenkins-slave-maven.svg)](https://hub.docker.com/r/jnonino/jenkins-slave-maven/)
[![](hhttps://img.shields.io/docker/build/jnonino/jenkins-slave-maven)](https://hub.docker.com/r/jnonino/jenkins-slave-maven/)
[![](https://img.shields.io/docker/automated/jnonino/jenkins-slave-maven)](https://hub.docker.com/r/jnonino/jenkins-slave-maven/)
[![](https://img.shields.io/docker/stars/jnonino/jenkins-slave-maven)](https://hub.docker.com/r/jnonino/jenkins-slave-maven/)
[![](https://img.shields.io/github/license/jnonino/jenkins-slave-maven-docker-image)](https://github.com/jnonino/jenkins-slave-maven-docker-image)
[![](https://img.shields.io/github/issues/jnonino/jenkins-slave-maven-docker-image)](https://github.com/jnonino/jenkins-slave-maven-docker-image)
[![](https://img.shields.io/github/issues-closed/jnonino/jenkins-slave-maven-docker-image)](https://github.com/jnonino/jenkins-slave-maven-docker-image)
[![](https://img.shields.io/github/languages/code-size/jnonino/jenkins-slave-maven-docker-image)](https://github.com/jnonino/jenkins-slave-maven-docker-image)
[![](https://img.shields.io/github/repo-size/jnonino/jenkins-slave-maven-docker-image)](https://github.com/jnonino/jenkins-slave-maven-docker-image)

Jenkins Slave for Maven builds. Docker image based on Maven official image.

## Tools Installed ##

- Maven
- Open Java JDK
- Git
- Subversion
- Mercurial
- wget
- curl
- unzip
- OpenSSH
- CA Certificates

## Add certificate to connect to HTTPS repositories

To add custom certificates and root CAs, create a new Dockerfile and import them with the following code.

	FROM jnonino/jenkins-slave-maven
	LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

	# Trust Root CA
	COPY Root_CA.crt /tmp
	RUN keytool -importcert -alias Root_CA -keystore ${JAVA_HOME}/jre/lib/security/cacerts -storepass changeit -file /tmp/Root_CA.crt -noprompt && \
		cp /tmp/Root_CA.crt /usr/local/share/ca-certificates/ && \
		chmod 644 /usr/local/share/ca-certificates/Root_CA.crt && \
		update-ca-certificates

	CMD ["/bin/bash"]
