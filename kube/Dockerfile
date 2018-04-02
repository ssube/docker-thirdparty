FROM apextoaster/base:master

ENV KUBECTL_VERSION=1.9.6
ENV KOPS_VERSION=1.8.1

RUN apt install -y curl git python python-pip \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && mv -v kubectl /usr/local/bin/ \
 && chmod a+x /usr/local/bin/kubectl \
 && curl -LO https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64 \
 && mv -v kops-linux-amd64 /usr/local/bin/kops \
 && chmod a+x /usr/local/bin/kops