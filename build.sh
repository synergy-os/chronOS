#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh

# Set up first-setup system
cp -r /ctx/system/firstsetup /etc/
cp /ctx/services/systemsetup.service /lib/systemd/user/
systemctl enable systemsetup.service