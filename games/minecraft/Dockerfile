FROM centos:8

WORKDIR /data
VOLUME /data

COPY launcher.sh /root/launcher.sh
RUN yum -y update \
 && yum -y install java-1.8.0-openjdk \
 && chown root:root /root/launcher.sh \
 && chmod og+x /root/launcher.sh

EXPOSE 25565 25575

CMD echo eula=true > /data/eula.txt && /root/launcher.sh