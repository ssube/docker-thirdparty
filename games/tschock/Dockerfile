FROM apextoaster/base:master

ENV TSHOCK_VERSION 4.3.25

RUN apt-get update \
 && apt-get install -y mono-complete tzdata

WORKDIR /terraria

RUN wget --quiet https://github.com/Pryaxis/TShock/releases/download/v${TSHOCK_VERSION}/tshock_${TSHOCK_VERSION}.zip \
 && unzip tshock_${TSHOCK_VERSION}.zip \
 && rm tshock_${TSHOCK_VERSION}.zip \
 && chmod u+x /terraria/TerrariaServer.exe \
 && echo test

EXPOSE 7777

ENTRYPOINT ["mono", "/terraria/TerrariaServer.exe"]
CMD [ \
  "-configpath", "/config",  \
  "-worldpath", "/data", \
  "-autocreate", "2", "-world", "tshock.wld", "-maxplayers", "16", \
  "-ip", "0.0.0.0", "-port", "7777" ]