FROM apextoaster/node:16.3-master

ENV CODECOV_VERSION=3.7.2

RUN yarn global add codecov@${CODECOV_VERSION} \
 && curl -L https://codecov.io/bash -o /usr/local/bin/codecov-bash \
 && chmod a+x /usr/local/bin/codecov-bash