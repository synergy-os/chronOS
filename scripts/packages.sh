#!/bin/bash

set -ouex pipefail

# install pkgs
rpm-ostree install gstreamer1-plugin-openh264 \
	clapper \
	flatseal \
	secrets \
 	gcc \

# remove pkgs from base image
rpm-ostree override remove htop \
	nvtop \
	gnome-system-monitor \
	toolbox