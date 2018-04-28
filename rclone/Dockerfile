FROM apextoaster/base:1.0-master

ENV RCLONE_VERSION=1.39

ADD https://github.com/ncw/rclone/releases/download/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip /tmp/rclone.zip

RUN apt update \
 && apt install -y build-essential ca-certificates unzip \
 && cd /tmp \
 && unzip /tmp/rclone.zip \
 && mv /tmp/rclone-v${RCLONE_VERSION}-linux-amd64/rclone /usr/bin/rclone \
 && rm -rf /var/lib/apt/lists/*

CMD rclone
