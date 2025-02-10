#!/bin/bash

set -ouex pipefail

# conflict fix
dnf5 -y remove tuned-ppd
# install deps
dnf5 -y install libgtop2 \
    bluez-tools \
    hyprpicker \
    btop \
    brightnessctl \
    gnome-bluetooth \
    power-profiles-daemon \
    gvfs \
    swww \
    astal \
    astal-gjs \
    astal-gtk4 \
    astal-io \
    astal-libs \
    astal-lua \
    aylurs-gtk-shell2 \
    nodejs \
    meson

# compile
git clone https://github.com/Jas-SinghFSU/HyprPanel.git
cd HyprPanel
meson setup build
meson compile -C build
meson install -C build