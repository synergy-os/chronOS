#!/bin/bash

set -ouex pipefail

# install pkgs
dnf5 -y install gstreamer1-plugin-openh264 \
	hyprland \
	hyprpaper \
	hyprlock \
	hypridle \
	hyprsunset \
	hyprpolkitagent \
	hyprshot \
	hyprpanel \
	rofi-wayland \
	librewolf \
	gnome-weather \
	snapshot \
	gnome-calculator \
	totem \
	gnome-disks \
	gparted \
	gnome-logs \
	gnome-maps \
	evince \
	gnome-clocks \
	loupe \
	secrets \
 	gcc \
	git

# remove pkgs from base image
dnf5 -y remove htop \
	plasma-desktop \
	nvtop \
 	firefox-langpacks \
	firefox \
	toolbox
