#!/bin/bash

set -ouex pipefail

# fixes
ln -s /usr/bin/rpm-ostree /usr/bin/chruln
ln -s /usr/bin/systemctl /usr/bin/cserv

# systemsetup and apx
cp /ctx/system/applications/sysupdate.desktop /usr/share/applications/
rm /usr/share/apx/stacks/vanilla.yaml \
    /usr/share/apx/stacks/vanilla-dev.yaml \
    /usr/share/apx/stacks/opensuse-leap-15.6.yaml

# copy system files
cp -r /ctx/system/firstsetup /etc/
cp -r /ctx/services/* /etc/systemd/system
mv /nix /var/nix-store

# enable systemd services/mounts
systemctl enable nix-daemon # enable nix daemon
systemctl enable systemsetup.service # enable systemsetup
systemctl enable nix.automount # enable automount for /var/nix-store to /nix