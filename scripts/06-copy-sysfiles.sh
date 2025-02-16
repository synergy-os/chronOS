#!/bin/bash

# prep
set -ouex pipefail

# systemsetup
cp /ctx/system/applications/sysupdate.desktop /usr/share/applications/

# copy/move system files
cp -r /ctx/system/skel /etc/skel
cp -r /ctx/system/firstsetup /etc/
cp -r /ctx/services/* /etc/systemd/system/
