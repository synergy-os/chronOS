#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh

# Set up first-setup system
cp -r /ctx/system/firstsetup /etc/
cp /ctx/services/systemsetup.service /etc/systemd/system
cp /ctx/services/fix.service /etc/systemd/system
systemctl enable systemsetup.service
systemctl enable fix.service
