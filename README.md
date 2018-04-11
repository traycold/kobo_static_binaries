# Static Binaries for Kobo
Collection of build recipes and binaries for Kobo eBook Readers.

I made the build using a virtual machine with Ubuntu [12.04.5 LTS](http://releases.ubuntu.com/12.04/ "12.04.5 LTS") i386 server.

Common steps to prepare the VM for the cross compilation for kobo:
```bash
#update the system
sudo apt-get upgrade
#install the cross-compilation toolchain for kobo
sudo apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
#install generic build tools
git build-essential libtool automake cmake ragel pck-config unzip texinfo
#build and install a recent version of automake (1.15), needed by some binanies
kobo_static_binaries/cross-compilation-utils/build-automake_1.15.sh
```
### Nano
Nano v2.9.5, using ncurses v6.1.
Automake v1.15 is needed for the build process (see [build-automake_1.15.sh](cross-compilation-utils/build-automake_1.15.sh "build-automake_1.15.sh"))
### Bash
Credit to [robxu9](https://github.com/robxu9/bash-static "robxu9") for the build instructions.
Need musl-gcc (see [download-musleabi.sh](cross-compilation-utils/download-musleabi.sh "download-musleabi.sh"))
