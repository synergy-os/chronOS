#!/bin/bash

# setup
set -ouex pipefail
BUILD_DEPS="go make gettext desktop-file-utils meson glib2 glib2-devel gtk-update-icon-cache"
rpm-ostree install $BUILD_DEPS
mkdir /tmp/gocache
mkdir /usr/cmp

# compile apx
git clone --recursive https://github.com/Vanilla-OS/apx.git /tmp/apx
cd /tmp/apx
sed -i 's,\(GOARCH=amd64\),\1 GOCACHE=/tmp/gocache,' Makefile
sed -i "s%PREFIX := /usr&PREFIX := /usr/cmp/apx%g" Makefile
make build 
make install && make install-manpages

# compile apx-gui
git clone https://github.com/Vanilla-OS/apx-gui /tmp/apx-gui
cd /tmp/apx-gui
meson setup build -Dprefix=/usr/cmp/apx
ninja -C build
ninja -C build install

rpm-ostree remove $BUILD_DEPS