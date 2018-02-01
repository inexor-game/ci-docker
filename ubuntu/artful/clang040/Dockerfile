FROM ubuntu:17.10

## FRIENDLY REMINDER: Don't push breaking changes to the master branch, without using it in inexor-core/master

## Try to run everything in one step, this will reduce the docker image size dramatically
## Docker is working with diffs, every step is creating a new diff, one step means just one diff
## therefore unnecessary interim stages are not saved

## Notes: ncftp needed to upload nightlies; don't install pip via apt but directly to get latest version

ENV CMAKE_VERSION=3.10 \
    CMAKE_VERSION_COMPLETE=3.10.2

RUN apt-get update \
    && apt-get -y install sudo autoconf binutils build-essential git libtool python-dev clang-4.0 \
    && apt-get -y --no-install-recommends install ncftp wget zip unzip \
    && apt-get -y --no-install-recommends install freeglut3-dev \
    && apt-get -y --no-install-recommends install libpangocairo-1.0-0 libxcomposite1 libxrandr2 libxcursor1 libatk1.0-0 libcups2 libnss3 libgconf-2-4 libxss1 libasound2 libxtst6 libgtk2.0-dev libgtk2.0-0 libgdk-pixbuf2.0-dev \
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


# TODO: Can we get rid of the CEF related deps? (libnss3, libgconf-2-4 etc...)
