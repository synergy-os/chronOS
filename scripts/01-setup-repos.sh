#!/bin/bash

# prep
set -ouex pipefail

# enable coprs
dnf5 -y copr enable lilay/topgrade # topgrade repository
dnf5 -y copr enable chronos/syspkgs # main chronOS repository
dnf5 -y copr enable solopasha/hyprland # hyprland deps repository
dnf5 -y copr enable pvermeer/chromebook-linux-audio # chromebook audio support
dnf5 -y copr enable bgstack15/AfterMozilla # librewolf repository
dnf5 -y copr enable pabrahamsson/hyprpanel # hyprpanel repository
# dnf5 -y copr enable petersen/nix # nix repository, will be integrated soon
