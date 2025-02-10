#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Compilation
rm /root && mkdir /root
bash /ctx/system/compile/apx.sh
bash /ctx/system/compile/astal.sh
bash /ctx/system/compile/ags.sh
rm -r /root
ln -s /var/roothome /root
dnf5 -y autoremove

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh
