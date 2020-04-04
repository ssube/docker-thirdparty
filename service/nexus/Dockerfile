FROM maven:3-jdk-8 AS build

ARG NEXUS_VERSION=3.21.2
ARG NEXUS_BUILD=03

RUN apt-get update -y \
  && apt-get install -y git \
  && git clone https://github.com/sonatype-nexus-community/nexus-repository-composer.git /nexus-repository-composer/ \
  && cd /nexus-repository-composer/ \
  && sed -i "s/3.19.1-01/${NEXUS_VERSION}-${NEXUS_BUILD}/g" pom.xml \
  && mvn clean package -PbuildKar;

FROM sonatype/nexus3:3.21.2

ARG NEXUS_VERSION=3.21.2
ARG NEXUS_BUILD=03

ENV RCLONE_VERSION=1.47.0

ADD https://github.com/ncw/rclone/releases/download/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip /tmp/rclone.zip

USER root
RUN yum update -y \
 && yum install -y ca-certificates python3-pip unzip \
 && cd /tmp \
 && unzip /tmp/rclone.zip \
 && mv -v /tmp/rclone-v${RCLONE_VERSION}-linux-amd64/rclone /usr/bin/rclone

RUN pip3 install --upgrade awscli

COPY --from=build /nexus-repository-composer/nexus-repository-composer/target/nexus-repository-composer-*-bundle.kar /opt/sonatype/nexus/deploy/

USER nexus
