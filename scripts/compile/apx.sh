#!/bin/bash

set -ouex pipefail
rpm-ostree install go git make podman meson glib2-devel desktop-file-utils

git clone --recursive https://github.com/Vanilla-OS/apx.git
cd apx
make build
make install
make install-manpages
cd ..
rm -rf apx
