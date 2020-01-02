FROM ubuntu:bionic

RUN adduser conanserver \
 && apt-get update -y \
 && apt-get install -y lib32gcc1 screen software-properties-common wget xvfb \
 && dpkg --add-architecture i386

RUN apt-get update -y \
 && echo steam steam/question select "I AGREE" | debconf-set-selections \
 && echo steam steam/license note '' | debconf-set-selections \
 && apt-get install -y steam steamcmd

RUN cd /usr/games \
 && ./steamcmd +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /home/conanserver/server +app_update 443030 +exit

RUN wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - \
 && apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' \
 && apt-get update -y \
 && apt-get install -y winehq-stable

WORKDIR /usr/games/server

CMD [ "/bin/sh", "-c", "xvfb-run --auto-servernum --server-args='-screen 640x480x24:32' wine /home/conanserver/server/ConanSandboxServer.exe -log"]