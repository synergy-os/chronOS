#!/bin/bash

set -ouex pipefail

# prep
RELEASE="$(rpm -E %fedora)"
chmod +x /ctx/scripts/compile/*.sh -R
chmod +x /ctx/scripts/packages/*.sh -R
/ctx/scripts/reposetup.sh

# Run compilation scripts
# /root needs to be replaced since it's a broken symlink
rm /root && mkdir /root
/ctx/scripts/compile/apx.sh
/ctx/scripts/compile/grimblast.sh
rm -r /root
ln -s /var/roothome /root

# Remove unused pkgs if any
dnf5 -y autoremove

# Run package scripts
/ctx/scripts/packages/rmpkgs.sh
/ctx/scripts/packages/syspkgs.sh
/ctx/scripts/packages/hyprpackages.sh

# Run touchup script
/ctx/scripts/quirks.sh
