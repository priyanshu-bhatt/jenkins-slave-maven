# Jenkins Slave Maven

[![](https://img.shields.io/docker/pulls/cnservices/jenkins-slave-maven.svg)](https://hub.docker.com/r/cnservices/jenkins-slave-maven/)
[![](hhttps://img.shields.io/docker/build/cnservices/jenkins-slave-maven)](https://hub.docker.com/r/cnservices/jenkins-slave-maven/)
[![](https://img.shields.io/docker/automated/cnservices/jenkins-slave-maven)](https://hub.docker.com/r/cnservices/jenkins-slave-maven/)
[![](https://img.shields.io/docker/stars/cnservices/jenkins-slave-maven)](https://hub.docker.com/r/cnservices/jenkins-slave-maven/)
[![](https://img.shields.io/github/license/cn-docker/jenkins-slave-maven)](https://github.com/cn-docker/jenkins-slave-maven)
[![](https://img.shields.io/github/issues/cn-docker/jenkins-slave-maven)](https://github.com/cn-docker/jenkins-slave-maven)
[![](https://img.shields.io/github/issues-closed/cn-docker/jenkins-slave-maven)](https://github.com/cn-docker/jenkins-slave-maven)
[![](https://img.shields.io/github/languages/code-size/cn-docker/jenkins-slave-maven)](https://github.com/cn-docker/jenkins-slave-maven)
[![](https://img.shields.io/github/repo-size/cn-docker/jenkins-slave-maven)](https://github.com/cn-docker/jenkins-slave-maven)

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

	FROM cnservices/jenkins-slave-maven
	LABEL maintainer="CN Services <noninojulian@gmail.com>"

	# Trust Root CA
	COPY Root_CA.crt /tmp
	RUN keytool -importcert -alias Root_CA -keystore ${JAVA_HOME}/jre/lib/security/cacerts -storepass changeit -file /tmp/Root_CA.crt -noprompt && \
		cp /tmp/Root_CA.crt /usr/local/share/ca-certificates/ && \
		chmod 644 /usr/local/share/ca-certificates/Root_CA.crt && \
		update-ca-certificates

	CMD ["/bin/bash"]
