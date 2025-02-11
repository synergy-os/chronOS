#!/bin/bash

# prep
set -ouex pipefail
RELEASE="$(rpm -E %fedora)"

# Set up repositories
/ctx/scripts/main/reposetup.sh

# Run compilation scripts
# /root needs to be replaced since it's a broken symlink
rm /root && mkdir /root
/ctx/scripts/compile/apx.sh
/ctx/scripts/compile/grimblast.sh
rm -r /root
ln -s /var/roothome /root

# Remove unused pkgs if any
echo "::group:: === Autoremove"
dnf5 -y autoremove
echo "::endgroup::"

# Run package scripts
/ctx/scripts/packages/rmpkgs.sh
/ctx/scripts/packages/syspkgs.sh
/ctx/scripts/packages/hyprpkgs.sh

# Run touchup script
/ctx/scripts/main/quirks.sh
