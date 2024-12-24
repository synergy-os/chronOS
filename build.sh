#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh

# Enable services
cp /ctx/services/postinstall.service /etc/systemd/system
cp /ctx/binaries/postinstall /usr/bin
systemctl enable postinstall.service
