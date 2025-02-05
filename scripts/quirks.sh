#!/bin/bash

set -ouex pipefail

# fixes
rm /usr/bin/sudo
ln -s /usr/bin/rpm-ostree /usr/bin/chruln
ln -s /usr/bin/systemctl /usr/bin/cserv
ln -s /usr/bin/pkexec /usr/bin/sudo

# systemsetup and apx
cp /ctx/system/applications/sysupdate.desktop /usr/share/applications/
rm /usr/share/apx/stacks/vanilla.yaml \
    /usr/share/apx/stacks/vanilla-dev.yaml \
    /usr/share/apx/stacks/opensuse-leap-15.6.yaml

# copy/move system files
cp -r /ctx/system/skel /etc/skel
cp -r /ctx/system/firstsetup /etc/
cp -r /ctx/services/system/* /etc/systemd/system/
# cp -r /ctx/services/user/* /etc/systemd/user/ # nothing in here at the moment
# mv /nix /etc/sysnix

# change SELinux policy for Nix
# semanage fcontext -a -t etc_t '/etc/sysnix/store/[^/]+/etc(/.*)?'
# semanage fcontext -a -t lib_t '/etc/sysnix/store/[^/]+/lib(/.*)?'
# semanage fcontext -a -t systemd_unit_file_t '/etc/sysnix/store/[^/]+/lib/systemd/system(/.*)?'
# semanage fcontext -a -t man_t '/etc/sysnix/store/[^/]+/man(/.*)?'
# semanage fcontext -a -t bin_t '/etc/sysnix/store/[^/]+/s?bin(/.*)?'
# semanage fcontext -a -t usr_t '/etc/sysnix/store/[^/]+/share(/.*)?'
# semanage fcontext -a -t var_run_t '/etc/sysnix/var/nix/daemon-socket(/.*)?'
# semanage fcontext -a -t usr_t '/etc/sysnix/var/nix/profiles(/per-user/[^/]+)?/[^/]+'

# enable systemd services/mounts
# systemctl enable nix-daemon # enable nix daemon
systemctl enable flatpak-user-setup.service # enable flatpak user setup
systemctl enable remove-system-flathub.service # enable system flathub removal
systemctl enable remove-system-flatpaks.service # enable system flatpak removal
systemctl enable systemsetup.service # enable system setup service
