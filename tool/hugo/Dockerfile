FROM docker.artifacts.apextoaster.com/apextoaster/node:16.14-master

RUN apt-get -qq update \
 && apt install -y build-essential ca-certificates curl git openssh-client python-pygments \
 && rm -rf /var/lib/apt/lists/*

# Download and install hugo
ENV HUGO_VERSION 0.91.2
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
 && rm /tmp/hugo.deb
