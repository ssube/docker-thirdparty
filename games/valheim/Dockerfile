FROM ubuntu:bionic

RUN adduser valheimserver \
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

ENV VALHEIM_VERSION "2021.02.16"
RUN cd /usr/games \
 && ./steamcmd +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /home/valheimserver/server +app_update 896660 +exit

WORKDIR /home/valheimserver/server

COPY start_valheim.sh /home/valheimserver/server

# CMD [ "/bin/bash", "-c", "xvfb-run --auto-servernum --server-args='-screen 640x480x24:32' env"]
CMD [ "/bin/bash", "-c", "/home/valheimserver/server/start_valheim.sh"]
