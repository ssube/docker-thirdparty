FROM apextoaster/base:master

# Download and install node
ENV NODE_VERSION 9.x

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash - \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install -y nodejs yarn \
 && rm -frv /var/lib/apt/lists/*
