FROM docker.artifacts.apextoaster.com/apextoaster/base:1.4-master

RUN apt-get -qq update \
 && apt-get install -y software-properties-common \
 && apt-add-repository ppa:ansible/ansible \
 && apt-get -qq update \
 && apt-get install -y build-essential libssl-dev libffi-dev openssh-client python-dev python-pip \
 && rm -rf /var/lib/apt/lists/*

RUN pip install "ansible~=2.7.0"
