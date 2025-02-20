#!/bin/bash

# prep
set -ouex pipefail

# install system pkgs
dnf5 -y install gstreamer1-plugin-openh264 \
	sddm \
	librewolf \
	gnome-weather \
	snapshot \
	gnome-calculator \
	totem \
	gnome-disks \
	gnome-tweaks \
	gparted \
	gnome-logs \
	gnome-maps \
	evince \
	gnome-clocks \
	loupe \
	secrets \
	file-roller \
	nautilus \
	sushi \
	gnome-text-editor \
	sysconf \
	flatpak-usr \
	topgrade \
	tealdeer \
	atuin \
	didyoumean \
	apx-gui \
	apx-conf \
    apx
