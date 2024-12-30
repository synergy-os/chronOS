#!/bin/bash

set -ouex pipefail

# install pkgs
rpm-ostree install gstreamer1-plugin-openh264 \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
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
	zsh \
 	gcc

# remove pkgs from base image
rpm-ostree remove htop \
	nvtop \
	ptyxis \
	gnome-system-monitor \
	toolbox