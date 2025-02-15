#!/bin/bash

# prep
set -ouex pipefail

# setup custom commands
ln -s /usr/bin/rpm-ostree /usr/bin/chruln
ln -s /usr/bin/systemctl /usr/bin/cserv
cp /ctx/system/bin/sudo /usr/bin/pkexec
cp /ctx/system/bin/sudo /usr/bin/sudo
chmod +x /usr/bin/sudo
chmod +x /usr/bin/pkexec
