FROM apextoaster/node:12.20-master

# install main packages and clean up
RUN apt-get -qq update \
 && apt-get install -y openjdk-11-jre-headless \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && rm -rf /var/lib/apt/lists/*

ENV SONAR_VERSION=4.4.0.2170

WORKDIR /sonar

RUN curl -LO https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_VERSION}.zip \
 && unzip sonar-scanner-cli-${SONAR_VERSION}.zip \
 && ls -lha \
 && mv -v sonar-scanner-${SONAR_VERSION}/* ./ \
 && rm -v sonar-scanner-cli-${SONAR_VERSION}.zip \
 && chmod -v a+x /sonar/bin/sonar-scanner /sonar/bin/sonar-scanner-debug

ENV PATH=/sonar/bin:${PATH}
