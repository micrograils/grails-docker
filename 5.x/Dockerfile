# syntax=docker/dockerfile:1
FROM eclipse-temurin:8-alpine
LABEL com.micrograils.docker.authors="aaron@micrograils.com"

ARG GRAILS_VERSION=5.2.2
ENV GRAILS_VERSION ${GRAILS_VERSION}

WORKDIR /opt/
RUN wget https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails

ENV GRAILS_HOME /opt/grails
ENV PATH $GRAILS_HOME/bin:$PATH

RUN mkdir /app
WORKDIR /app

ENTRYPOINT ["grails"]
CMD ["-version"]