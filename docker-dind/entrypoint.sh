#!/bin/bash
set -e

echo "Starting dockerd..."

CMD=$*
if [[ "$CMD" == '' ]];
then
  dind dockerd ${DOCKER_EXTRA_OPTS}
  check_docker
else
  dind dockerd ${DOCKER_EXTRA_OPTS} &
  until docker info;
  do
    echo "Waiting for dockerd to start..."
    sleep 5
  done
  echo "Starting cmd..."
  exec "$CMD"
fi

