FROM apextoaster/base:1.4-master

ENV LICENSED_VERSION 1.5.2

RUN curl -L https://github.com/github/licensed/releases/download/${LICENSED_VERSION}/licensed-${LICENSED_VERSION}-linux-x64.tar.gz -o licensed.tar.gz \
 && tar -C /usr/local/bin -xzf licensed.tar.gz \
 && chmod a+x /usr/local/bin/licensed
