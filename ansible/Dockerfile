FROM apextoaster/base:master

RUN apt update \
 && apt install -y software-properties-common \
 && apt-add-repository ppa:ansible/ansible \
 && apt update \
 && apt install -y build-essential libssl-dev libffi-dev openssh-client python-dev python-pip \
 && pip install ansible

CMD ansible-playbook
