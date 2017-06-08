FROM ubuntu:16.04

## Try to run everything in one step, this will reduce the docker image size dramatically
## https://www.ianlewis.org/en/creating-smaller-docker-images

RUN apt-get update \
    && apt-get -y install sudo binutils build-essential cmake libgconf2-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libudev-dev zlib1g-dev wget clang-3.8 gcc-5 g++-5 \
    && cd /var/cache/apt/archives \
    && wget "http://launchpadlibrarian.net/283310560/protobuf-compiler_3.0.0-7ubuntu3_amd64.deb" \
    && wget "http://launchpadlibrarian.net/283310559/libprotoc10_3.0.0-7ubuntu3_amd64.deb" \
    && wget "http://launchpadlibrarian.net/283310548/libprotobuf-dev_3.0.0-7ubuntu3_amd64.deb" \
    && wget "http://launchpadlibrarian.net/283310558/libprotobuf10_3.0.0-7ubuntu3_amd64.deb" \
    && wget "http://launchpadlibrarian.net/283310556/libprotobuf-lite10_3.0.0-7ubuntu3_amd64.deb" \
    && dpkg --install protobuf-compiler_3.0.0-7ubuntu3_amd64.deb libprotoc10_3.0.0-7ubuntu3_amd64.deb libprotobuf-dev_3.0.0-7ubuntu3_amd64.deb libprotobuf10_3.0.0-7ubuntu3_amd64.deb libprotobuf-lite10_3.0.0-7ubuntu3_amd64.deb \
    && apt-get -y install libfontconfig1 libfreetype6 libnss3 libxcomposite1 libxtst6 libgconf-2-4 libcups2 libcairo2 libpango-1.0-0 libpangocairo-1.0-0 \
    && ln -sf /lib/$(arch)-linux-gnu/libudev.so.1 /lib/$(arch)-linux-gnu/libudev.so.0 \
    && export SUDO_FORCE_REMOVE=yes \
    && apt-get -y purge sudo wget \
    && apt-get -y clean \
    && apt-get -y autoremove


# TODO: Can we get rid of the CEF related deps? (libfontconfig1..)
