#!/bin/bash

set -ouex pipefail
BUILD_DEPS="go make fuse-overlayfs fuse gettext desktop-file-utils meson glib2 glib2-devel gtk-update-icon-cache"
rpm-ostree install $BUILD_DEPS

# setup overlayfs
mkdir -p /comproot /comproot.work
mkdir -p /temproot /temproot.work
fuse-overlayfs -o lowerdir=/usr,upperdir=/comproot,workdir=/comproot.work,allow_other /usr
fuse-overlayfs -o lowerdir=/root,upperdir=/temproot,workdir=/temproot.work,allow_other /root

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
fusermount -u -z /root
rm -rf /temproot /temproot.work
rpm-ostree remove $BUILD_DEPS