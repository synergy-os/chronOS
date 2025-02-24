#!/bin/bash

# prep
set -ouex pipefail

# install hyprland-related pkgs
dnf5 -y install hyprland \
	hyprpaper \
	hyprlock \
	hypridle \
	hyprsunset \
	hyprpolkitagent \
	hyprshot \
	hyprland-material-you \
	hyprctl \
	hyprpicker \
	rofi-wayland \
	rubygem-sass \
