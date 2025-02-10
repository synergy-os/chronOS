#!/bin/bash

set -ouex pipefail

# install deps
dnf5 -y install meson \
    vala \
    valadoc \
    gtk3-devel \
    gtk-layer-shell-devel \
    gobject-introspection-devel \
    wayland-protocols-devel

# clone repos
git clone https://github.com/aylur/astal.git /tmp/astal
git clone https://github.com/aylur/astal /tmp/astal-js

# astal-io
cd /tmp/astal/lib/astal/io
meson setup --prefix /usr build
meson install -C build

# astal3
cd /tmp/astal/lib/astal/gtk3
meson setup --prefix /usr build
meson install -C build

# astal-js
cd /tmp/astal-js/lang/gjs
meson setup --prefix /usr build
meson install -C build