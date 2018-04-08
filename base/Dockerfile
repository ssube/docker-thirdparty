FROM ubuntu:16.04

ENV GOSS_VERSION 0.3.5

# install main packages and clean up
RUN apt-get -qq update \
 && apt-get install -y build-essential ca-certificates curl dnsutils git jq openssh-client python-dev python-pip telnet unzip wget zip \
 && pip install --upgrade pip awscli yq \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && rm -rf /var/lib/apt/lists/*

# install blackbox (master)
RUN git clone https://github.com/StackExchange/blackbox.git blackbox \
 && cd blackbox \
 && make copy-install

# install goss
RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v${GOSS_VERSION}/goss-linux-amd64 -o /usr/local/bin/goss \
 && chmod +rx /usr/local/bin/goss