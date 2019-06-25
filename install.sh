#!/bin/bash

set -e
set -u
set -x


# install packages required by TeX Live installer
apt update
apt install --no-install-recommends --yes \
        podbrowser \
        wget


# download TeX Live installer
tmp="$(mktemp --directory)"

cd "$tmp"
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xvfz install-tl-unx.tar.gz --strip-component 1
cd -

# install TeX Live
"$tmp"/install-tl --profile="$1"

# remove installation files
rm -rf "$tmp"


# install texliveonfly to handle missing packages
PATH="/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
tlmgr install texliveonfly


# remove packages required by TeX Live installer
apt remove --purge --yes \
        podbrowser \
        wget
rm -rf /var/lib/apt/lists/*
