#! /usr/bin/bash

ROOT="/data"
JAR="${ROOT}/minecraft.jar"
SRC="${SRC:-https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar}"
OPTS="${OPTS:--Xmx1024M -Xms1024M}"

if [[ ! -f "${JAR}" ]]; then
  curl "${SRC}" > "${JAR}"
fi

chmod a+x "${JAR}"
java ${OPTS} -jar "${JAR}" nogui