FROM ubuntu:bionic

# install main packages and clean up
RUN apt-get -qq update \
 && apt-get install -y build-essential ca-certificates curl dnsutils git gnupg2 jq openssh-client python3-dev ssh telnet unzip wget zip \
 && apt-get remove -y python-pip \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && rm -rf /var/lib/apt/lists/*

# install pip packages
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
 && python3 get-pip.py \
 && pip install --upgrade pip
RUN pip install --upgrade awscli openshift yq

# install k8s packages
ENV KUBECTL_VERSION=1.16.7
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && mv -v kubectl /usr/local/bin/ \
 && chmod a+x /usr/local/bin/kubectl

# install blackbox (master)
RUN git clone https://github.com/StackExchange/blackbox.git blackbox \
 && cd blackbox \
 && make copy-install

# install goss
ENV GOSS_VERSION 0.3.5
RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v${GOSS_VERSION}/goss-linux-amd64 -o /usr/local/bin/goss \
 && chmod +rx /usr/local/bin/goss

# install codeclimate test-reporter
ENV TEST_VERSION 0.1.4
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-${TEST_VERSION}-linux-amd64 -o /usr/local/bin/test-reporter \
 && chmod +rx /usr/local/bin/test-reporter

# Add ssh keys
RUN mkdir -p /root/.ssh \
 && ssh-keyscan github.com >> /root/.ssh/known_hosts \
 && ssh-keyscan git.apextoaster.com >> /root/.ssh/known_hosts
