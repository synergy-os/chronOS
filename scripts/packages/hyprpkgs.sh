#!/bin/bash

set -ouex pipefail

# install hyprland-related pkgs
dnf5 -y install hyprland \
	hyprpaper \
	hyprlock \
	hypridle \
	hyprsunset \
	hyprpolkitagent \
	hyprshot \
	hyprpanel \
	hyprctl \
	hyprpicker \
	rofi-wayland \
	rubygem-sass
