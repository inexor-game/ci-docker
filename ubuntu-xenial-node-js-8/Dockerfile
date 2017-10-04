FROM ubuntu:16.04

# Ubuntu Xenial + Node.js 8 (not a LTS version)

RUN apt-get update \
    && apt-get -y install sudo autoconf binutils build-essential git libtool nasm python-dev gcc g++ \
    && rm /etc/apt/sources.list \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update \
    && apt-get -y install nodejs npm \
    && apt-get -y clean \
    && apt-get -y autoremove \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /var/log/* \
    && rm -rf /var/tmp/* \
    && rm -rf /var/lib/apt/mirrors/* \
    && rm -rf /var/lib/apt/lists/*
