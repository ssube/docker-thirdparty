FROM docker.artifacts.apextoaster.com/apextoaster/base:1.4-master

# install jdk
RUN apt update -qq \
 && apt-get install -y openjdk-11-jre-headless \
 && rm -rf /var/lib/apt/lists/*

# install dep
ENV BFG_VERSION 1.13.0
RUN curl https://repo1.maven.org/maven2/com/madgag/bfg/${BFG_VERSION}/bfg-${BFG_VERSION}.jar -o /usr/bin/bfg.jar

CMD ["java", "-jar", "/usr/bin/bfg.jar"]
