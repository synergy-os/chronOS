#!/bin/bash

# setup
set -ouex pipefail
BUILD_DEPS="go make gettext desktop-file-utils meson glib2 glib2-devel gtk-update-icon-cache"
rpm-ostree install $BUILD_DEPS
mkdir /tmp/gocache && mkdir /usr/cmp
rm /root && mkdir /root

# compile apx
git clone --recursive https://github.com/Vanilla-OS/apx.git /tmp/apx
cd /tmp/apx
sed -i "s%PREFIX := /usr%PREFIX := /usr/cmp/apx%g" Makefile
go env -w GOCACHE=/tmp/gocache
make build 
make install && make install-manpages

# compile apx-gui
git clone https://github.com/Vanilla-OS/apx-gui /tmp/apx-gui
cd /tmp/apx-gui
meson setup build -Dprefix=/usr/cmp/apx-gui
ninja -C build
ninja -C build install

rpm-ostree remove $BUILD_DEPS
rm -r /root && ln -s /var/roothome /root