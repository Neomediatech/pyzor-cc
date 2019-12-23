#!/bin/bash

LISTEN_PORT=${LISTEN_PORT:-}

exec /tini -e 143 -- python3 ./pyzorsocket.py 0.0.0.0 ${LISTEN_PORT}
