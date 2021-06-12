FROM apextoaster/base:1.4-master

# Download and install node
ENV NODE_VERSION 16.x

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash - \
 && apt-get update \
 && apt-get install -y nodejs \
 && rm -frv /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install -y yarn \
 && rm -frv /var/lib/apt/lists/*
