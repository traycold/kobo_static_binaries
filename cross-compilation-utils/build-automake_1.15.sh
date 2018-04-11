#!/bin/bash

# run as root only
if [[ $EUID -ne 0 ]] ; then
    echo -e "\e[1;39m[   \e[31mError\e[39m   ] need root access to run this script\e[0;39m"
    exit 1
fi

# the temp directory used, within $DIR
# omit the -p parameter to create a temporal directory in the default location
WORK_DIR=`mktemp -d

# check if tmp dir was created
if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

# deletes the temp directory
function cleanup {      
  rm -rf "$WORK_DIR"
  echo "Deleted temp working directory $WORK_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

function install_automake() {
    [ $# -eq 0 ] && { run_error "Usage: install_automake <version>"; exit; }
    local VERSION=${1}
    wget ftp://ftp.gnu.org/gnu/automake/automake-${VERSION}.tar.gz &> /dev/null
    if [ -f "automake-${VERSION}.tar.gz" ]; then
            tar -xzf automake-${VERSION}.tar.gz
            cd automake-${VERSION}/
            ./configure
            make && make install
            echo -e "\e[1;39m[   \e[1;32mOK\e[39m   ] automake-${VERSION} installed\e[0;39m"

        else
            echo -e "\e[1;39m[   \e[31mError\e[39m   ] cannot fetch file from ftp://ftp.gnu.org/gnu/automake/ \e[0;39m"
            exit 1
    fi
}

cd "$WORK_DIR"
install_automake 1.15
