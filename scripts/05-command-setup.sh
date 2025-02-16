#!/bin/bash

# prep
set -ouex pipefail

# setup custom commands
ln -s /usr/bin/rpm-ostree /usr/bin/chruln
ln -s /usr/bin/systemctl /usr/bin/cserv
cp /bin/sudo /usr/bin/sudo
cp /bin/sudo /usr/bin/pkexec

