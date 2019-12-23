#!/bin/bash

LISTEN_PORT=${LISTEN_PORT:-}
PYZOR_SERVER=${PYZOR_SERVER:-}

if [ "${PYZOR_SERVER}" != "" ]; then
    mkdir -p /root/.pyzor
    echo "${PYZOR_SERVER}:24441" > /root/.pyzor/servers
fi

exec /tini -e 143 -- python3 ./pyzorsocket.py 0.0.0.0 ${LISTEN_PORT}
