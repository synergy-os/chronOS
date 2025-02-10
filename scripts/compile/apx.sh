#!/bin/bash

# prep
echo "::group:: === Compile apx ==="
set -ouex pipefail

# prep/install deps
dnf5 -y install go make
mkdir -p /usr/share/apx

# compile
git clone --recursive https://github.com/Vanilla-OS/apx.git /tmp/apx
git clone https://github.com/Vanilla-OS/vanilla-apx-configs.git /usr/share/apx
cd /tmp/apx
make build
make install
make install-manpages

# cleanup
cd /
rm -rf /tmp/apx
echo "::endgroup::"
