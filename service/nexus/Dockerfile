FROM sonatype/nexus3:3.33.0

USER root
RUN yum update -y \
 && yum install -y ca-certificates python3-pip unzip

RUN pip3 install --upgrade awscli

ARG RCLONE_VERSION=1.56.0
ADD https://github.com/ncw/rclone/releases/download/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip /tmp/rclone.zip

RUN cd /tmp \
 && unzip /tmp/rclone.zip \
 && mv -v /tmp/rclone-v${RCLONE_VERSION}-linux-amd64/rclone /usr/bin/rclone

# install goss
ARG GOSS_VERSION=0.3.16
ADD https://github.com/aelsabbahy/goss/releases/download/v${GOSS_VERSION}/goss-linux-amd64 /usr/local/bin/goss
RUN chmod +rx /usr/local/bin/goss

USER nexus
