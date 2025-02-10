#!/bin/bash

set -ouex pipefail

dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable pvermeer/chromebook-linux-audio
dnf5 -y copr enable bgstack15/AfterMozilla
dnf5 -y copr enable heus-sueh/packages
dnf5 -y copr enable petersen/nix
dnf5 -y config-manager --save --setopt=copr:copr.fedorainfracloud.org:heus-sueh:packages.priority=200
