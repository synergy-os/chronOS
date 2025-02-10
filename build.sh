#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"
chmod +x /ctx/scripts/compile/*.sh -R

# Compilation
rm /root && mkdir /root
/ctx/scripts/compile/apx.sh
/ctx/scripts/compile/astal.sh
/ctx/scripts/compile/ags.sh
/ctx/scripts/compile/hyprpanel.sh
rm -r /root
ln -s /var/roothome /root
dnf5 -y autoremove

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh
