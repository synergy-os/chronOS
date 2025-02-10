#!/bin/bash

set -ouex pipefail

# install deps
dnf5 -y install grim \
    slurp \
    wl-clipboard \
    jq

# clone repo
git clone https://github.com/hyprwm/contrib /tmp/contrib
cd /tmp/contrib/grimblast

# compile
make
make install

# cleanup
cd /
rm -rf /tmp/contrib
