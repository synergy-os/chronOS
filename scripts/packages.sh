#!/bin/bash

set -ouex pipefail

# install pkgs
dnf5 install gstreamer1-plugin-openh264 \
	konqueror \
	kweather \
	kamoso \
	kcalc \
	haruna \
	isoimagewriter \
	kde-partitionmanager \
	ksystemlog \
	marble \
	okular \
	kclock \
	gwenview \
	secrets \
	klassy \
 	gcc \
	git

# remove pkgs from base image
dnf5 remove htop \
	nvtop \
 	firefox-langpacks \
	firefox \
	toolbox
