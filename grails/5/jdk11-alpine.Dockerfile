# syntax=docker/dockerfile:1
FROM eclipse-temurin:11-jdk-alpine
LABEL com.micrograils.docker.authors="aaron@micrograils.com"

ARG GRAILS_VERSION=5.2.3
ENV GRAILS_VERSION=${GRAILS_VERSION} GRAILS_HOME=/opt/grails PATH=/opt/grails/bin:$PATH

WORKDIR /opt
COPY Dockerfile /opt

RUN wget https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails && \
    mkdir /app && \
    grails -version

WORKDIR /app

VOLUME ["/root/.gradle", "/root/.m2", "/app"]
EXPOSE 8080

CMD ["/bin/sh"]