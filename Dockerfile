FROM ubuntu:18.04

ENV VERSION=1.0.0 \
    SERVICE=pyzor-cc \
    OS=ubuntu \
    DEBIAN_FRONTEND=noninteractive \
    LISTEN_PORT=5953

LABEL maintainer="docker-dario@neomediatech.it" \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-type=Git \
      org.label-schema.vcs-url=https://github.com/Neomediatech/$SERVICE \
      org.label-schema.maintainer=Neomediatech

RUN apt-get update && apt-get -y dist-upgrade && apt-get --no-install-recommends install -y python3 python-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install setuptools && \
    pip install wheel && \
    pip install pyzor && \
    cp -ar /usr/local/lib/python2.7/dist-packages/pyzor* /usr/lib/python3.6/ && \
    sed -i 's/\.iteritems/\.items/' /usr/lib/python3.6/pyzor/client.py && \
    rm -rf /usr/local/share/doc /usr/local/share/man && \
    sed -i 's/ xrange(/ range(/' /usr/lib/python3.6/pyzor/digest.py

COPY pyzor/pyzorsocket/pyzorsocket.py /pyzorsocket.py
COPY bin/* /
RUN chmod +x /tini /entrypoint.sh

EXPOSE ${LISTEN_PORT}
# or what you declared with LISTEN_PORT

# HEALTHCHECK --interval=30s --timeout=30s --start-period=20s --retries=20 CMD nc -w 7 -zv 0.0.0.0 5953
# need some best idea

ENTRYPOINT ["/entrypoint.sh"]
