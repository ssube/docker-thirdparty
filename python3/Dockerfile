FROM apextoaster/base:1.0-master

ENV PYTHON_VER 3

RUN apt update \
 && apt install -y python${PYTHON_VER} python${PYTHON_VER}-pip \
 && pip3 install --upgrade pip
