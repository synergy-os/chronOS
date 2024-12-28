#!/bin/bash

set -ouex pipefail

# apx
git clone --recursive https://github.com/Vanilla-OS/apx.git
cd apx
make build
make install
make install-manpages
cd /
rm -rf apx

# apx-gui
git clone https://github.com/Vanilla-OS/apx-gui
cd apx-gui
meson setup build
ninja -C build
ninja -C build install
cd /
rm -rf apx-gui