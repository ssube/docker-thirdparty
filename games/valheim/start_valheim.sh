#! /bin/bash

set -euxo pipefail

Xvfb :1 -screen 0 640x480x24 &
export DISPLAY=:1

env
wine valheim_server -nographics -batchmode -name "${SERVER_NAME}" -port 2456 -world "${SERVER_WORLD}" -password "${SERVER_PASS}"
