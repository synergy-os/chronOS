#!/bin/bash

set -ouex pipefail

# install deps
dnf5 -y install wireplumber \
    upower \
    libgtop2 \
    bluez \
    bluez-tools \
    grimblast \
    hyprpicker \
    btop \
    NetworkManager \
    wl-clipboard \
    swww \
    brightnessctl \
    gnome-bluetooth \
    power-profiles-daemon \
    gvfs \
    nodejs
# conflict fix
dnf5 -y remove tuned-ppd
npm install -g sass

# compile
git clone https://github.com/Jas-SinghFSU/HyprPanel.git
cd HyprPanel
meson setup build
meson compile -C build
meson install -C build