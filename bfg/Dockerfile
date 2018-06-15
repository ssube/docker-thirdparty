FROM apextoaster/base:1.0-master

# install jdk
RUN apt update -qq \
 && apt-get install -y openjdk-9-jre-headless \
 && rm -rf /var/lib/apt/lists/*

ENV BFG_VERSION 1.13.0

# install dep
RUN curl http://repo1.maven.org/maven2/com/madgag/bfg/${BFG_VERSION}/bfg-${BFG_VERSION}.jar -o /usr/bin/bfg.jar

CMD ["java", "-jar", "/usr/bin/bfg.jar"]