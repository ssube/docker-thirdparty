FROM docker.artifacts.apextoaster.com/apextoaster/base:1.5-master

ENV PYTHON_MAJOR 3
ENV PYTHON_MINOR 7

RUN apt update \
 && apt install -y python${PYTHON_MAJOR}.${PYTHON_MINOR} python${PYTHON_MAJOR}-pip \
 && pip${PYTHON_MAJOR} install --upgrade pip
