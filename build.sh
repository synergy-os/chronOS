#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh

# Set up first-setup system
cp -r /ctx/system/firstsetup /etc/
mkdir -p /root/.config/systemd/user/gnome-session.target.wants/
cp /ctx/services/systemsetup.service /root/.config/systemd/user/gnome-session.target.wants/
systemctl enable --user systemsetup.service