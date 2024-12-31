#!/bin/bash

set -ouex pipefail

# install pkgs
rpm-ostree install chromebook-linux-audio \
	gstreamer1-plugin-openh264 \
	blackbox-terminal \
	gettext \
	python3-gobject \
	python3-pyyaml \
	python3-requests \
	gobject-introspection \
	gobject-introspection-devel \
 	util-linux \
	clapper \
	flatseal \
	secrets \
 	gcc \
	nix

# remove pkgs from base image
rpm-ostree override remove htop \
	nvtop \
	ptyxis \
	gnome-system-monitor \
	toolbox