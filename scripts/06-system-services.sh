#!/bin/bash

# prep
set -ouex pipefail

# enable system services
systemctl enable flatpak-user-setup.service # enable flatpak user setup
systemctl enable remove-system-flathub.service # enable system flathub removal
systemctl enable remove-system-flatpaks.service # enable system flatpak removal
systemctl enable systemsetup.service # enable system setup service
