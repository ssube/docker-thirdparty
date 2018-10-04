FROM sonatype/nexus3:3.13.0

ENV RCLONE_VERSION=1.39

ADD https://github.com/ncw/rclone/releases/download/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip /tmp/rclone.zip

USER root
RUN yum update -y \
 && yum install -y build-essential ca-certificates unzip \
 && cd /tmp \
 && unzip /tmp/rclone.zip \
 && mv -v /tmp/rclone-v${RCLONE_VERSION}-linux-amd64/rclone /usr/bin/rclone

USER nexus