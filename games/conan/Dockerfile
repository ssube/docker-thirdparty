FROM docker.artifacts.apextoaster.com/library/ubuntu:bionic

RUN adduser conanserver \
 && dpkg --add-architecture i386 \
 && apt-get update -y \
 && apt-get install -y lib32gcc1 screen software-properties-common wget xvfb

RUN apt-get update -y \
 && echo steam steam/question select "I AGREE" | debconf-set-selections \
 && echo steam steam/license note '' | debconf-set-selections \
 && apt-get install -y steam steamcmd

RUN wget -qO - https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/Release.key | apt-key add - \
 && apt-add-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/ ./' \
 && apt-get update -y

RUN wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - \
 && apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' \
 && apt-get update -y \
 && apt-get install -y --install-recommends winehq-stable

ENV CONAN_VERSION "10.03.2020"
RUN cd /usr/games \
 && ./steamcmd +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /home/conanserver/server +app_update 443030 +exit

WORKDIR /usr/games/server

CMD [ "/bin/sh", "-c", "xvfb-run --auto-servernum --server-args='-screen 640x480x24:32' wine /home/conanserver/server/ConanSandboxServer.exe -log"]
