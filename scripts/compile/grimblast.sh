#!/bin/bash

# prep
echo "::group:: === Compile grimblast ==="
set -ouex pipefail

# install deps
dnf5 -y install grim \
    slurp \
    wl-clipboard \
    jq \
    scdoc

# install
wget -O /usr/bin \
    https://raw.githubusercontent.com/hyprwm/contrib/refs/heads/main/grimblast/grimblast

# cleanup
cd /
rm -rf /tmp/contrib
echo "::endgroup::"
