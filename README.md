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
