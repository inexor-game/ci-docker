FROM ubuntu:16.04

# Ubuntu Xenial + latest Node.js non-LTS version: 8

RUN apt-get update \
    && apt-get -y install sudo autoconf binutils build-essential git libtool nasm python-dev gcc g++ \
    && curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
    && sudo apt-get install -y nodejs \
    && apt-get -y clean \
    && apt-get -y autoremove \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /var/log/* \
    && rm -rf /var/tmp/* \
    && rm -rf /var/lib/apt/mirrors/* \
    && rm -rf /var/lib/apt/lists/*
