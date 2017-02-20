FROM ubuntu:17.04

## FRIENDLY REMINDER: Don't push breaking changes to the master branch, without using it in code/master

## Try to run everything in one step, this will reduce the docker image size dramatically
## Docker is working with diffs, every step is creating a new diff, one step means just one diff
## therefore unnecessary interim stages are not saved

## && apt-get -y --no-install-recommends install sudo binutils build-essential cmake doxygen libboost-filesystem-dev libboost-graph-dev libboost-program-options-dev libboost-random-dev libboost-regex-dev libboost-signals-dev libboost-thread-dev libenet-dev libgconf2-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libudev-dev protobuf-compiler libprotoc10 libprotobuf-dev libprotobuf10 libprotobuf-lite10 zlib1g-dev clang-3.9 gcc-6 g++-6 \

RUN apt-get update \
    && apt-get -y install sudo autoconf binutils build-essential cmake doxygen git libtool nasm clang-3.5 clang-3.9 gcc-6 g++-6 wget \
    && apt-get -y --no-install-recommends install python-dev libgtk2.0-dev libgtkglext1-dev \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && python -m pip install conan \
    && ln -sf /lib/$(arch)-linux-gnu/libudev.so.1 /lib/$(arch)-linux-gnu/libudev.so.0 \
    && apt-get -y purge wget \
    && apt-get -y clean \
    && apt-get -y autoremove \
    && rm -rf /usr/share/man/* \ 
    && rm -rf /usr/share/doc/* \
    && rm -rf /var/log/* \
    && rm -rf /var/tmp/* \
    && rm -rf /var/lib/apt/mirrors/* \
    && rm -rf /var/lib/apt/lists/*


# TODO: Can we get rid of the CEF related deps? (libfontconfig1..)

# TODO: Get rid of this manually workaround http://askubuntu.com/questions/288821/how-do-i-resolve-a-cannot-open-shared-object-file-libudev-so-0-error
