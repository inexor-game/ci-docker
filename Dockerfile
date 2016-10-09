FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install sudo binutils build-essential cmake doxygen libboost-filesystem-dev libboost-graph-dev libboost-program-options-dev libboost-random-dev libboost-regex-dev libboost-signals-dev libenet-dev libgconf2-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libudev-dev zlib1g-dev wget

# TODO: Get rid of these uglyness
# install libprotobuf-dev & protobuf-compiler packages
RUN cd /var/cache/apt/archives
RUN wget "http://launchpadlibrarian.net/283310560/protobuf-compiler_3.0.0-7ubuntu3_amd64.deb"
RUN wget "http://launchpadlibrarian.net/283310559/libprotoc10_3.0.0-7ubuntu3_amd64.deb"

RUN wget "http://launchpadlibrarian.net/283310548/libprotobuf-dev_3.0.0-7ubuntu3_amd64.deb"
RUN wget "http://launchpadlibrarian.net/283310558/libprotobuf10_3.0.0-7ubuntu3_amd64.deb"
RUN wget "http://launchpadlibrarian.net/283310556/libprotobuf-lite10_3.0.0-7ubuntu3_amd64.deb"

RUN dpkg --install protobuf-compiler_3.0.0-7ubuntu3_amd64.deb libprotoc10_3.0.0-7ubuntu3_amd64.deb libprotobuf-dev_3.0.0-7ubuntu3_amd64.deb libprotobuf10_3.0.0-7ubuntu3_amd64.deb libprotobuf-lite10_3.0.0-7ubuntu3_amd64.deb

# If clang:
RUN apt-get -y install clang-3.8 

# IF gcc
RUN apt-get -y install gcc-5 g++-5

# Not used right now. Please don't remove.
## If win64 or win32 cross
## RUN apt-get -y install mingw-w64
##
## IF macos
## install homebrew..
## brew install sdl2
##
## IF apidoc doxygen


# TODO: Can we get rid of the following deps?
# CEF related deps
RUN apt-get -y install libfontconfig1 libfreetype6 libnss3 libxcomposite1 libxtst6 libgconf-2-4 libcups2 libcairo2 libpango-1.0-0 libpangocairo-1.0-0

# TODO: Get rid of this manually workaround http://askubuntu.com/questions/288821/how-do-i-resolve-a-cannot-open-shared-object-file-libudev-so-0-error
RUN ln -sf /lib/$(arch)-linux-gnu/libudev.so.1 /lib/$(arch)-linux-gnu/libudev.so.0

# Make the built smaller:
RUN apt-get -y clean
RUN apt-get -y autoremove
