#!/bin/bash

set -euxo pipefail

# setup overlayfs
mkdir -p /comproot /comproot.work
fuse-overlayfs -o lowerdir=/usr,upperdir=/comproot,workdir=/comproot.work,allow_other /usr

# compile apx
git clone --recursive https://github.com/Vanilla-OS/apx.git /tmp/apx
cd /tmp/apx
make build 
make install && make install-manpages

# compile apx-gui
git clone https://github.com/Vanilla-OS/apx-gui /tmp/apx-gui
cd /tmp/apx-gui
meson setup build
ninja -C build
ninja -C build install

fusermount -u -z /usr