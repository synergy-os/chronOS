#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh

# Set up two-auth system
useradd -M --system -s /bin/false Admin
echo Admin:default | chpasswd

# Set up first-setup system
cp -r /ctx/system/firstsetup /etc/
mkdir /etc/skel/.config/
mkdir /etc/skel/.config/autostart
cp /ctx/system/firstsetup/misc/skel/firstsetup.desktop /etc/skel/.config/autostart/