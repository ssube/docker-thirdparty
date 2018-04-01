FROM ubuntu:16.04

RUN apt-get -qq update \
 && apt install -y build-essential ca-certificates curl dnsutils git jq openssh-client python-dev python-pip telnet unzip wget zip \
 && pip install --upgrade pip awscli yq \
 && rm -rf /var/lib/apt/lists/* \
 && git clone https://github.com/StackExchange/blackbox.git blackbox \
 && cd blackbox \
 && make copy-install
