#!/bin/bash

set -ouex pipefail

# fixes
ln -s /usr/bin/rpm-ostree /usr/bin/chruln
ln -s /usr/bin/systemctl /usr/bin/cserv
cp /ctx/system/applications/sysupdate.desktop /usr/share/applications/
rm /usr/share/apx/stacks/vanilla.yaml \
    /usr/share/apx/stacks/vanilla-dev.yaml \
    /usr/share/apx/stacks/opensuse-leap-15.6.yaml
systemctl enable nix-daemon