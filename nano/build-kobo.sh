#!/bin/sh

##prerequisite: autoconf >=1.15
# you can build it from scratch using script "build-automake_1.15.sh"

# build ncurses
cd ncurses
./build-kobo.sh
cd ..

#build nano
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export CROSS_PREFIX=arm-linux-gnueabihf-
export CFLAGS="-fPIC -O2 -mcpu=cortex-a9 -mfpu=neon -static"
export CPPFLAGS="-I${DIR}/ncurses/nano-build/ncurses-install/usr/include"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-L${DIR}/ncurses/nano-build/ncurses-install/usr/lib"
./configure \
	--host=arm-linux-gnueabihf \
	--disable-nls \
	--disable-dependency-tracking
make
arm-linux-gnueabihf-strip -s src/nano
mv src/nano .

#final executable is: "./nano"