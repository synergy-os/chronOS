#!/bin/bash

# prep
set -ouex pipefail

# install system pkgs
dnf5 -y install gstreamer1-plugin-openh264 \
	slick-greeter \
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
	file-roller \
	nautilus \
	sushi \
	gnome-text-editor \
	apx-gui \
	apx-conf \
    apx

# swap fedora-logos and chronos due to conflicts
dnf5 -y swap \
--repo=copr:copr.fedorainfracloud.org:chronos:syspkgs \
	fedora-logos chronos
