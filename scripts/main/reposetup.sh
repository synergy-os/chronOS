#!/bin/bash

# prep
echo "::group:: === Setup repositories ==="
set -ouex pipefail

# enable coprs
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable pvermeer/chromebook-linux-audio
dnf5 -y copr enable bgstack15/AfterMozilla
dnf5 -y copr enable pabrahamsson/hyprpanel
dnf5 -y copr enable petersen/nix
dnf5 -y copr enable chronos/syspkgs

# cleanup
echo "::endgroup::"
