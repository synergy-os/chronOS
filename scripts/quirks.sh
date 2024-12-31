#!/bin/bash

set -ouex pipefail

# fixes
ln -s /usr/bin/rpm-ostree /usr/bin/chruln
ln -s /usr/bin/systemctl /usr/bin/cserv
cp /ctx/system/applications/sysupdate.desktop /usr/share/applications/
ln -s /usr/cmp/apx/bin/apx /usr/bin/apx
ln -s /usr/cmp/apx-gui/bin/apx-gui /usr/bin/apx-gui
ln -s /usr/cmp/apx-gui/share/applications/org.vanillaos.ApxGUI.desktop /usr/share/applications/org.vanillaos.ApxGUI.desktop
cp -r /usr/cmp/apx-gui/share/icons/hicolor/scalable/actions/* /usr/share/icons/hicolor/scalable/actions/
cp -r /usr/cmp/apx-gui/share/icons/hicolor/scalable/apps/* /usr/share/icons/hicolor/scalable/apps/
cp -r /usr/cmp/apx-gui/share/icons/hicolor/symbolic/apps/* /usr/share/icons/hicolor/symbolic/apps/
mkdir /usr/share/apx && git clone https://github.com/Vanilla-OS/vanilla-apx-configs.git /usr/share/apx