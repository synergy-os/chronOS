#!/bin/bash

set -ouex pipefail

# install pkgs
rpm-ostree install gstreamer1-plugin-openh264 \
	clapper \
	cosmic-desktop \
	flatseal \
	secrets \
 	gcc

# remove pkgs from base image
rpm-ostree override remove htop \
	nvtop \
 	firefox-langpacks \
	firefox \
	gnome-system-monitor \
	toolbox \
 	firefox
