#!/bin/bash

# prep
set -ouex pipefail
rpm-ostree install go make
rm /root && mkdir /root
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
rm -r /root
ln -s /var/roothome /root
rpm-ostree override remove go make