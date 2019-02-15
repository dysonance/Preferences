#!/bin/bash

# exit if an error occurs
set -e

# define variables/settings to build as desired
PYTHON_REPOSITORY="https://github.com/python/cpython"
FRAMEWORK_DIRECTORY=$HOME/Preferences/apps/frameworks

# define environment for dependencies
if ! [ -x "$(command -v openssl)" ]; then
    echo "installing dependency openssl"
    brew install openssl xz
fi
SSL_DIRECTORY=$(brew --prefix openssl)

# setup the required directory structure
cd $HOME/Preferences/apps/python
if ! [ -d "versions" ]; then
    mkdir versions
fi
if ! [ -d "versions/$PYTHON_VERSION" ]; then
    mkdir versions/$PYTHON_VERSION
fi
if ! [ -d "src" ]; then
    git clone "$PYTHON_REPOSITORY" src
fi

# get the appropriate version of the source code to build
cd src
if [ "$1" == "" ]; then
    PYTHON_VERSION=$(git tag | grep -v rc | grep -v "[ab][0-9]" | tail -n1 | sed 's/v//g')
else
    PYTHON_VERSION="$1"
fi

INSTALL_DIRECTORY="$HOME/Preferences/apps/python/versions/$PYTHON_VERSION"
git checkout v$PYTHON_VERSION

# configure the installation
# NOTE: configuration for versions < 3.7 is different
# FIXME: installing as a framework (req for vim YCM plugin) is all messed up

if [ "$(echo $PYTHON_VERSION | cut -c 1-3)" == "3.7" ]; then

    git clean -xfd
    ./configure \
        --prefix=$INSTALL_DIRECTORY \
        --datadir=$INSTALL_DIRECTORY/share \
        --datarootdir=$INSTALL_DIRECTORY/share \
        --enable-optimizations \
        --enable-framework=$FRAMEWORK_DIRECTORY \
        --enable-ipv6 \
        --enable-loadable-sqlite-extensions \
        --with-openssl=$SSL_DIRECTORY \
        --with-dtrace \
        --without-ensurepip \
        --without-gcc

    make -j $CPU
    make -j $CPU install

else

    git clean -xfd
    export CPPFLAGS="-I$SSL_DIRECTORY/include -I/usr/local/include -I/usr/local/opt/zlib/include"
    export LDFLAGS="-L$SSL_DIRECTORY/lib -L/usr/local/lib -L/usr/local/opt/zlib/lib"
        ./configure \
            --prefix=$INSTALL_DIRECTORY \
            --datarootdir=$INSTALL_DIRECTORY/share \
            --datadir=$INSTALL_DIRECTORY/share \
            --enable-framework=$FRAMEWORK_DIRECTORY \
            --enable-loadable-sqlite-extensions \
            --enable-ipv6 \
            --enable-optimizations \
            --with-dtrace \
            --without-ensurepip \
            --without-gcc \
            CPPFLAGS="$CPPFLAGS" LDFLAGS="$LDFLAGS"
    make -j $CPU
    make -j $CPU install PYTHONAPPSDIR=$INSTALL_DIRECTORY
    make -j $CPU frameworkinstallextras PYTHONAPPSDIR=$INSTALL_DIRECTORY/share/python

fi

# create symbolic links to simplify version management
cd $INSTALL_DIRECTORY/..
if [ -d "current" ]; then
    rm current
fi
ln -sf $PYTHON_VERSION current

# install pip
cd $INSTALL_DIRECTORY/../..
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
./versions/current/bin/python3 get-pip.py
