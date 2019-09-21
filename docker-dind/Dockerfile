FROM apextoaster/base:1.2-master

# docker itself
ARG DOCKER_CHANNEL=stable
ARG DOCKER_VERSION=18.09.9

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

# dind hacks
ARG DIND_COMMIT=master
ENV DOCKER_EXTRA_OPTS '--storage-driver=overlay2'
RUN curl -fL -o /usr/local/bin/dind "https://raw.githubusercontent.com/moby/moby/${DIND_COMMIT}/hack/dind" \
 && chmod +x /usr/local/bin/dind

# entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

#VOLUME /var/lib/docker
EXPOSE 2375
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
