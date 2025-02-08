#!/bin/bash

# prep
set -ouex pipefail
dnf5 -y install go make
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
rpm-ostree override remove git gcc glibc-devel go-filesystem golang golang-bin golang-src kernel-headers libserf libxcrypt-devel make mercurial perl-Error perl-File-Find perl-Git perl-TermReadKey perl-lib subversion subversion-libs utf8proc