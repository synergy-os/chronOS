#!/bin/bash

set -ouex pipefail
BUILD_DEPS="go make gettext desktop-file-utils meson glib2 glib2-devel gtk-update-icon-cache"
rpm-ostree install $BUILD_DEPS
rm /root && mkdir /root && rm -r /usr/local/share && mkdir /usr/local/share

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

rpm-ostree remove $BUILD_DEPS