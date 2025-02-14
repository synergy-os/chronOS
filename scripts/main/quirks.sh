#!/bin/bash

# prep
set -ouex pipefail

# fixes
ln -s /usr/bin/rpm-ostree /usr/bin/chruln
ln -s /usr/bin/systemctl /usr/bin/cserv
cp /ctx/system/bin/sudo /usr/bin/pkexec
cp /ctx/system/bin/sudo /usr/bin/sudo
chmod +x /usr/bin/sudo
chmod +x /usr/bin/pkexec

# systemsetup and apx
cp /ctx/system/applications/sysupdate.desktop /usr/share/applications/

# copy/move system files
cp -r /ctx/system/skel /etc/skel
cp -r /ctx/system/firstsetup /etc/
cp -r /ctx/services/* /etc/systemd/system/

# enable system services
systemctl enable flatpak-user-setup.service # enable flatpak user setup
systemctl enable remove-system-flathub.service # enable system flathub removal
systemctl enable remove-system-flatpaks.service # enable system flatpak removal
systemctl enable systemsetup.service # enable system setup service
