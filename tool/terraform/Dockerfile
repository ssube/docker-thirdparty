FROM apextoaster/base:1.3-master

ENV TF_VERSION 0.11.2

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
 && cd /tmp \
 && unzip /tmp/terraform.zip \
 && chmod 755 /tmp/terraform \
 && mv -v /tmp/terraform /usr/bin/terraform
