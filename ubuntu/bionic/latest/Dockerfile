FROM ubuntu:18.04

## FRIENDLY REMINDER: Don't push breaking changes to the master branch, without using it in inexor-core/master

## Try to run everything in one step, this will reduce the docker image size dramatically
## Docker is working with diffs, every step is creating a new diff, one step means just one diff
## therefore unnecessary interim stages are not saved

## Notes: don't install pip via apt but directly to get latest version

ENV CMAKE_VERSION=3.12 \
    CMAKE_VERSION_COMPLETE=3.12.0

RUN apt-get update \
    && apt-get -y install sudo autoconf binutils build-essential git libtool nasm python-dev clang-5.0 g++-8 \
    && apt-get -y --no-install-recommends install wget zip unzip \
    && wget https://cmake.org/files/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION_COMPLETE}-Linux-x86_64.tar.gz --no-check-certificate \
    && tar -xzf cmake-${CMAKE_VERSION_COMPLETE}-Linux-x86_64.tar.gz \
    && cp -fR cmake-${CMAKE_VERSION_COMPLETE}-Linux-x86_64/* /usr \
    && rm -rf cmake-${CMAKE_VERSION_COMPLETE}-Linux-x86_64 \
    && rm cmake-${CMAKE_VERSION_COMPLETE}-Linux-x86_64.tar.gz \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && python -m pip install conan \
    && apt-get -y purge wget \
    && apt-get -y clean \
    && apt-get -y autoremove \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /var/log/* \
    && rm -rf /var/tmp/* \
    && rm -rf /var/lib/apt/mirrors/* \
    && rm -rf /var/lib/apt/lists/*
