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
cp -r /ctx/system/skel/* /etc/skel/