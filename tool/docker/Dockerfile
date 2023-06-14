FROM docker.artifacts.apextoaster.com/apextoaster/base:1.5-master

# docker itself
ARG DOCKER_CHANNEL=stable
ARG DOCKER_VERSION=20.10.8

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   ${DOCKER_CHANNEL}"
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
   docker-ce=5:${DOCKER_VERSION}~3-0~ubuntu-bionic \
   docker-ce-cli=5:${DOCKER_VERSION}~3-0~ubuntu-bionic \
 && rm -rf /var/lib/apt/lists/*

RUN docker -v \
 && dockerd -v

COPY scripts /build-scripts
