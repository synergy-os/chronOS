#!/bin/bash

set -ouex pipefail
rpm-ostree install go git make podman meson glib2-devel

# apx
git clone --recursive https://github.com/Vanilla-OS/apx.git
cd apx
make build
make install
make install-manpages
cd ..
rm -rf apx

# apx-gui
git clone https://github.com/Vanilla-OS/apx-gui
cd apx-gui
meson setup build
ninja -C build
ninja -C build install
cd ..
rm -rf apx-gui
