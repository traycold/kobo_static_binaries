#!/bin/sh

#current dir
CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "current dir is ${CURR_DIR}"

#dir of musl compiler: adapt to your installation
MUSL_TRIPLE=arm-linux-musleabi
MUSL_DIR="${CURR_DIR}/../cross-compilation-utils/${MUSL_TRIPLE}"
echo "musl dir is ${MUSL_DIR}"

#make bash
export PATH="${MUSL_DIR}/bin:$PATH"
export CROSS_PREFIX="${MUSL_TRIPLE}-"
export CFLAGS="-fPIC -O2 -mcpu=cortex-a9 -mfpu=neon -static"
./configure \
	--host=${MUSL_TRIPLE} \
	--without-bash-malloc
make

STRIP="${MUSL_DIR}/bin/${MUSL_TRIPLE}-strip -s bash"
eval "$STRIP"
mv bash ../binaries
echo "final executable is: ../binaries/bash"