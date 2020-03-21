FROM maven:3-jdk-8 AS build

ARG NEXUS_VERSION=3.21.1
ARG NEXUS_BUILD=01

RUN apt-get update -y \
  && apt-get install -y git \
  && git clone https://github.com/sonatype-nexus-community/nexus-repository-composer.git /nexus-repository-composer/ \
  && cd /nexus-repository-composer/ \
  && sed -i "s/3.13.0-01/${NEXUS_VERSION}-${NEXUS_BUILD}/g" pom.xml \
  && mvn clean package

FROM sonatype/nexus3:3.21.1

ARG NEXUS_VERSION=3.21.1
ARG NEXUS_BUILD=01

ENV RCLONE_VERSION=1.47.0

ADD https://github.com/ncw/rclone/releases/download/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip /tmp/rclone.zip

USER root
RUN yum update -y \
 && yum install -y ca-certificates python3-pip unzip \
 && cd /tmp \
 && unzip /tmp/rclone.zip \
 && mv -v /tmp/rclone-v${RCLONE_VERSION}-linux-amd64/rclone /usr/bin/rclone

RUN pip3 install --upgrade awscli

ARG COMPOSER_VERSION=0.0.2
ARG COMPOSER_DIR=/opt/sonatype/nexus/system/org/sonatype/nexus/plugins/nexus-repository-composer/${COMPOSER_VERSION}/

RUN mkdir -p ${COMPOSER_DIR}; \
    sed -i 's@nexus-repository-maven</feature>@nexus-repository-maven</feature>\n        <feature prerequisite="false" dependency="false" version="0.0.2">nexus-repository-composer</feature>@g' /opt/sonatype/nexus/system/org/sonatype/nexus/assemblies/nexus-core-feature/${NEXUS_VERSION}-${NEXUS_BUILD}/nexus-core-feature-${NEXUS_VERSION}-${NEXUS_BUILD}-features.xml; \
    sed -i 's@<feature name="nexus-repository-maven"@<feature name="nexus-repository-composer" description="org.sonatype.nexus.plugins:nexus-repository-composer" version="0.0.2">\n        <details>org.sonatype.nexus.plugins:nexus-repository-composer</details>\n        <bundle>mvn:org.sonatype.nexus.plugins/nexus-repository-composer/0.0.2</bundle>\n    </feature>\n    <feature name="nexus-repository-maven"@g' /opt/sonatype/nexus/system/org/sonatype/nexus/assemblies/nexus-core-feature/${NEXUS_VERSION}-${NEXUS_BUILD}/nexus-core-feature-${NEXUS_VERSION}-${NEXUS_BUILD}-features.xml;
COPY --from=build /nexus-repository-composer/target/nexus-repository-composer-${COMPOSER_VERSION}.jar ${COMPOSER_DIR}

USER nexus
