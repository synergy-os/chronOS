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
	material-you-hyprland \
	hyprctl \
	hyprpicker \
	rofi-wayland \
	rubygem-sass \
