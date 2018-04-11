#!/bin/sh

export CROSS_PREFIX=arm-linux-gnueabihf-
export CFLAGS="-fPIC -O2 -mcpu=cortex-a9 -mfpu=neon"
export CXXFLAGS="$CFLAGS"

./configure \
	--host=arm-linux-gnueabihf \
  --disable-shared \
  --enable-static \
  --with-normal \
  --without-debug \
  --without-ada \
  --with-default-terminfo=/usr/share/terminfo \
  --with-terminfo-dirs="/etc/terminfo:/lib/terminfo:/usr/share/terminfo:/usr/lib/terminfo"

make DESTDIR="../nano-build/ncurses-install" install.libs install.includes
