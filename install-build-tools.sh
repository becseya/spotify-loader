#!/bin/bash

DIR_TOOLCHAIN="$1"
TOOLCHAIN_URL='https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2'

set -euxo pipefail

sudo apt-get update

sudo apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    python-is-python3 \
    scons \
    git \
    wget \
    jq \
    clang-format \
    cmake \
    cpputest \
    pkg-config

pip3 install \
    modm \
    Pillow

wget -qO- "$TOOLCHAIN_URL" | tar -xj -C "$DIR_TOOLCHAIN"
