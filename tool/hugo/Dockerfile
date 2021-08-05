FROM apextoaster/node:16.6-master

RUN apt-get -qq update \
 && apt install -y build-essential ca-certificates curl git openssh-client python-pygments \
 && rm -rf /var/lib/apt/lists/*

# Download and install hugo
ENV HUGO_VERSION 0.58.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
 && rm /tmp/hugo.deb
